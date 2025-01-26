ifeq ($(THEOS_PACKAGE_SCHEME),rootful)
TARGET = iphone:clang:latest:11.0
else
TARGET = iphone:clang:latest:15.0
endif
ARCHS = arm64
PACKAGE_VERSION = 1.0.4
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTAutoFullScreen

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
