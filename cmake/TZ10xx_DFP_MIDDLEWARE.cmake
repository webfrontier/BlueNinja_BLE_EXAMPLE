cmake_minimum_required(VERSION 2.8)

# Include Directories

set(TZ10XX_DFP_MIDDLEWARE_INCLUDE_DIRECTORIES
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/blelib"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/blelib/Config"
)

include_directories(
  ${TZ10XX_DFP_MIDDLEWARE_INCLUDE_DIRECTORIES}
)

# Sources

set(TZ10XX_DFP_MIDDLEWARE_SOURCES
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC/twic_hash.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC/twic_interface.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC/twic_service.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC/tz1em.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/TWiC/tz1em_service.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/blelib/blelib.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/blelib/blelib_callback.c"
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Middleware/blelib/blelib_peripheral_statemachine.c"
)

add_library(tz10xx_dfp_middleware ${TZ10XX_DFP_MIDDLEWARE_SOURCES})
