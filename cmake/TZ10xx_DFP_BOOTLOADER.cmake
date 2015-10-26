cmake_minimum_required(VERSION 2.8)

enable_language(ASM)

# BootLoader

set(TZ10XX_DFP_BOOTLOADER
  "$ENV{SDK_DIR}TOSHIBA.TZ10xx_DFP/Device/Source/GCC/bootloader_TZ10xx.S"
)

add_library(tz10xx_dfp_bootloader ${TZ10XX_DFP_BOOTLOADER})
