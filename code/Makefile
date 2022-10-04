CPU = 16F1789
PROGRAMMER = PPK3

SRCS = main.asm
EXEC = main

AS-DIR = /opt/microchip/xc8/v2.36/pic-as/bin/
AS = $(AS-DIR)/pic-as

IPE-DIR = /opt/microchip/mplabx/v6.00/mplab_platform/mplab_ipe/
FLASH_CMD = java -jar $(IPE-DIR)/ipecmd.jar

AS_FLAGS = -mcpu=$(CPU) -xassembler-with-cpp -Wa,-a -Wl,-preset_vec=0h  \
           -Wl,-pisr_vec=4h
FLASH_ARGS = -T$(PROGRAMMER) -E -M -P$(CPU) -F"$(EXEC).hex" -OL

.PHONY: all clean flash

all: $(EXEC)

$(EXEC):
	$(AS) $(AS_FLAGS) $(SRCS) -o $(EXEC)

clean:
	-@rm -f *.elf
	-@rm -f *.hex
	-@rm -f *.hxl
	-@rm -f *.cmf
	-@rm -f *.sym
	-@rm -f *.lst
	-@rm -f *.rlf
	-@rm -f *.d
	-@rm -f *.i
	-@rm -f *.o
	-@rm -f MPLABXLog.xml

flash: $(EXEC)
	$(FLASH_CMD) $(FLASH_ARGS)
