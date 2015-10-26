cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

project(blueninja_ble_example C)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

#include(CMakeForceCompiler)
#set(CMAKE_C_COMPILER $ENV{TOOL_DIR}arm-none-eabi-gcc)
#set(CMAKE_C_COMPILER $ENV{CC})
set(CMAKE_AR $ENV{TOOL_DIR}arm-none-eabi-ar)
set(CMAKE_$ENV{TOOL_DIR}RANLIB arm-none-eabi-ranlib)
set(CMAKE_LINKER $ENV{TOOL_DIR}arm-none-eabi-gcc)
set(OBJCOPY $ENV{TOOL_DIR}arm-none-eabi-objcopy)

# Flags
set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -mthumb-interwork -march=armv7e-m -mfloat-abi=softfp -mfpu=fpv4-sp-d16 --specs=tz10xx.specs -std=c99 -Wall")
set(CMAKE_C_FLAGS_DEBUG "-g -O0")
set(CMAKE_C_FLAGS_RELEASE "-O3")
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m4 -mthumb -mthumb-interwork -march=armv7e-m -mfloat-abi=softfp -mfpu=fpv4-sp-d16 --specs=tz10xx.specs -T $ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Device/Source/GCC/gcc_TZ10xx.ld -Wl,-Map=${PROJECT_NAME}.map")
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)

# Modules
include(TZ10xx_DFP_BOOTLOADER)
include(TZ10xx_DFP_STARTUP)
include(TZ10xx_DFP)
include(TZ10xx_DFP_DRIVER)
include(TZ10xx_DFP_MIDDLEWARE)
include(CMSIS)
include(RTE)

# Include Directories

set(CDP_TZ01B_BSP_INCLUDE_DIRECTORIES
  "src/boards/CDP-TZ01B/include"
  "src/config"
  "src/drivers/include"
  "src/utils/include"
)

include_directories(
  ${CDP_TZ01B_BSP_INCLUDE_DIRECTORIES}
)

# Sources

set(CDP_TZ01B_BSP_SOURCES
  "src/ble_tracker.c"
  "src/boards/CDP-TZ01B/TZ01_airpressure.c"
  "src/boards/CDP-TZ01B/TZ01_battery_charger.c"
  "src/boards/CDP-TZ01B/TZ01_console.c"
  "src/boards/CDP-TZ01B/TZ01_motion_tracker.c"
  "src/boards/CDP-TZ01B/TZ01_system.c"
  "src/drivers/BMP280.c"
  "src/drivers/BQ24250.c"
  "src/drivers/MPU-9250.c"
  "src/main.c"
  "src/utils/utils.c"
)

add_executable(${PROJECT_NAME} ${CDP_TZ01B_BSP_SOURCES})

# Libraries
target_link_libraries(${PROJECT_NAME}
  tz10xx_dfp_bootloader
  tz10xx_dfp_startup
  tz10xx_dfp
  tz10xx_dfp_dirver
  tz10xx_dfp_middleware
  rte
)

add_custom_command(OUTPUT ${PROJECT_NAME}.tmp
  COMMAND ${OBJCOPY} -O binary ${PROJECT_NAME}${CMAKE_EXECUTABLE_SUFFIX} ${PROJECT_NAME}.tmp
  COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_NAME}.tmp ${PROJECT_NAME}.bin
  DEPENDS ${PROJECT_NAME}
  COMMENT "${PROJECT_NAME}${CMAKE_EXECUTABLE_SUFFIX} to ${PROJECT_NAME}.bin"
)
add_custom_target(${PROJECT_NAME}.bin ALL DEPENDS ${PROJECT_NAME}.tmp)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${PROJECT_NAME}.bin;${PROJECT_NAME}.map")
