boot.bin: boot.asm
	nasm boot.asm -o boot.bin
master.img: boot.bin
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

.PHONY:bochs
bochs:
	bochs -q -unlock

.PHONY:clean
make clean:
	rm -rf *.bin
	
