
include ./rules.mk

avrdude-eeleft:
	ls /dev/tty* > /tmp/1; \
	echo "Reset your Pro Micro now"; \
	while [[ -z $$USB ]]; do \
	  sleep 1; \
	  ls /dev/tty* > /tmp/2; \
	  USB=`diff /tmp/1 /tmp/2 | grep -o '/dev/tty.*'`; \
	done; \
	avrdude -p $(MCU) -c avr109 -P $$USB -U eeprom:w:./eeprom-lefthand.eep

avrdude-eeright:
	echo $(BUILD_DIR)/..
	ls /dev/tty* > /tmp/1; \
	echo "Reset your Pro Micro now"; \
	while [[ -z $$USB ]]; do \
	  sleep 1; \
	  ls /dev/tty* > /tmp/2; \
	  USB=`diff /tmp/1 /tmp/2 | grep -o '/dev/tty.*'`; \
	done; \
	avrdude -p $(MCU) -c avr109 -P $$USB -U eeprom:w:./eeprom-righthand.eep
