cmake_minimum_required(VERSION 2.8)

# Include Directories

set(RTE_INCLUDE_DIRECTORIES
  "RTE"
  "RTE/Device/TZ1001MBG"
)

set(RTE_MIDDLEWARE_INCLUDE_DIRECTORIES
  "RTE/Middleware/TZ1001MBG"
)

include_directories(
  ${CMSIS_INCLUDE_DIRECTORIES}
  ${RTE_INCLUDE_DIRECTORIES}
  ${RTE_MIDDLEWARE_INCLUDE_DIRECTORIES}
)


# Sources

set(RTE_MIDDLEWARE_SOURCES
  "RTE/Middleware/TZ1001MBG/twic_button.c"
  "RTE/Middleware/TZ1001MBG/twic_led.c"
  "RTE/Middleware/TZ1001MBG/twic_util_advertise.c"
  "RTE/Middleware/TZ1001MBG/twic_util_ancs.c"
  "RTE/Middleware/TZ1001MBG/twic_util_hrp.c"
  "RTE/Middleware/TZ1001MBG/twic_util_init.c"
  "RTE/Middleware/TZ1001MBG/twic_util_lemng.c"
  "RTE/Middleware/TZ1001MBG/twic_util_lesmp.c"
  "RTE/Middleware/TZ1001MBG/twic_util_service.c"
  "RTE/Middleware/TZ1001MBG/twic_util_udp.c"
  "RTE/Middleware/TZ1001MBG/tz1sm_hal.c"
)

add_library(rte ${RTE_MIDDLEWARE_SOURCES})
