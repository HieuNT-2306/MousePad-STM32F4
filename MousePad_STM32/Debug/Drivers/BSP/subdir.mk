################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/stm32f429i_discovery.c \
../Drivers/BSP/stm32f429i_discovery_eeprom.c \
../Drivers/BSP/stm32f429i_discovery_io.c \
../Drivers/BSP/stm32f429i_discovery_lcd.c \
../Drivers/BSP/stm32f429i_discovery_sdram.c \
../Drivers/BSP/stm32f429i_discovery_ts.c 

OBJS += \
./Drivers/BSP/stm32f429i_discovery.o \
./Drivers/BSP/stm32f429i_discovery_eeprom.o \
./Drivers/BSP/stm32f429i_discovery_io.o \
./Drivers/BSP/stm32f429i_discovery_lcd.o \
./Drivers/BSP/stm32f429i_discovery_sdram.o \
./Drivers/BSP/stm32f429i_discovery_ts.o 

C_DEPS += \
./Drivers/BSP/stm32f429i_discovery.d \
./Drivers/BSP/stm32f429i_discovery_eeprom.d \
./Drivers/BSP/stm32f429i_discovery_io.d \
./Drivers/BSP/stm32f429i_discovery_lcd.d \
./Drivers/BSP/stm32f429i_discovery_sdram.d \
./Drivers/BSP/stm32f429i_discovery_ts.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/%.o Drivers/BSP/%.su Drivers/BSP/%.cyclo: ../Drivers/BSP/%.c Drivers/BSP/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP

clean-Drivers-2f-BSP:
	-$(RM) ./Drivers/BSP/stm32f429i_discovery.cyclo ./Drivers/BSP/stm32f429i_discovery.d ./Drivers/BSP/stm32f429i_discovery.o ./Drivers/BSP/stm32f429i_discovery.su ./Drivers/BSP/stm32f429i_discovery_eeprom.cyclo ./Drivers/BSP/stm32f429i_discovery_eeprom.d ./Drivers/BSP/stm32f429i_discovery_eeprom.o ./Drivers/BSP/stm32f429i_discovery_eeprom.su ./Drivers/BSP/stm32f429i_discovery_io.cyclo ./Drivers/BSP/stm32f429i_discovery_io.d ./Drivers/BSP/stm32f429i_discovery_io.o ./Drivers/BSP/stm32f429i_discovery_io.su ./Drivers/BSP/stm32f429i_discovery_lcd.cyclo ./Drivers/BSP/stm32f429i_discovery_lcd.d ./Drivers/BSP/stm32f429i_discovery_lcd.o ./Drivers/BSP/stm32f429i_discovery_lcd.su ./Drivers/BSP/stm32f429i_discovery_sdram.cyclo ./Drivers/BSP/stm32f429i_discovery_sdram.d ./Drivers/BSP/stm32f429i_discovery_sdram.o ./Drivers/BSP/stm32f429i_discovery_sdram.su ./Drivers/BSP/stm32f429i_discovery_ts.cyclo ./Drivers/BSP/stm32f429i_discovery_ts.d ./Drivers/BSP/stm32f429i_discovery_ts.o ./Drivers/BSP/stm32f429i_discovery_ts.su

.PHONY: clean-Drivers-2f-BSP

