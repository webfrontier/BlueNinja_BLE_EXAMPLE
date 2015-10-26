cmake_minimum_required(VERSION 2.8)

# Include Directories

set(TZ10XX_DFP_INCLUDE_DIRECTORIES
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Device/Include"
)

include_directories(
  ${TZ10XX_DFP_INCLUDE_DIRECTORIES}
)

# Sources

set(TZ10XX_DFP_SOURCES
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Device/Source/system_TZ10xx.c"
)

add_library(tz10xx_dfp ${TZ10XX_DFP_SOURCES})
