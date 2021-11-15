## Learn-ASM

### Chapter One: Config work space
- hello.asm
```asm
mov ax, 0xb
mov ds, ax

mov byte [0], 'H'
halt:
	jmp halt
times 510 - ($ - $$) db 0
db 0x55, 0xaa
```
- bochs config
1. Download bochs, you can use pacman in arch, and compile asm
```shell
sudo pacman -S bochs
nasm hello.asm -o hello.bin
```
2. Generate bochsrc by command: 
```shell
bochs -q
```
3. And you need to modify file bochsrc for gui debug
```shell
display_library: x, options="gui_debug"
```
4. Use bximage to create img, and copy generate text to bochsrc
```shell
boot: disk //8
ata1: enabled=true, type=disk, path="mater.img", mode=flat //line 13
```
5. Write the img to bochs
```shell
dd if=hello.bin of=master.img bs=512 count=1 conv=notrunc
``
