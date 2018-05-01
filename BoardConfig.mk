# mt6737 platform boardconfig
DEVICE_PATH := device/motorola/nicklaus

# TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := mt6737m
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Architecture
FORCE_32_BIT := true
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# TARGET_USES_MKE2FS := true # Use MKE2FS for creating ext4 images

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/nicklaus
TARGET_KERNEL_CONFIG := nicklaus_defconfig
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
ifeq ($(FORCE_32_BIT),true)
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET := 0x00008000
else
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE          := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 2432696320
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 4698144768
BOARD_CACHEIMAGE_PARTITION_SIZE 	:= 419430400
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6735

# Seccomp filter
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# SELinux Policy
BOARD_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy

# Symbols
TARGET_LDPRELOAD += libshims.so

# System Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

