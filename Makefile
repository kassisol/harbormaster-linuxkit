
.PHONY: build
build:
	linuxkit build harbormaster.yml

.PHONY: clean
clean:
	rm -f harbormaster-cmdline
	rm -f harbormaster-initrd.img
	rm -f harbormaster-kernel
	rm -f testdisk.img
	rm -rf harbormaster-state

.PHONY: run
run:
	linuxkit run -disk testdisk.img,size=100M,format=qcow2 harbormaster

.DEFAULT_GOAL := build
