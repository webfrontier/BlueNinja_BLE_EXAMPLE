cmake_minimum_required(VERSION 2.8)

enable_language(ASM)

# Startup Code
set(TZ10XX_DFP_STARTUP
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Device/Source/GCC/startup_TZ10xx.S"
)

add_library(tz10xx_dfp_startup ${TZ10XX_DFP_STARTUP})
