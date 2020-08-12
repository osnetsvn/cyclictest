obj-m += hrtimer.o
ccflags-y := -std=gnu99 -Wno-declaration-after-statement

all: modules

modules:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

insert:
	insmod hrtimer.ko delay_us=4000

remove:
	rmmod hrtimer

.PHONY: clean
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
