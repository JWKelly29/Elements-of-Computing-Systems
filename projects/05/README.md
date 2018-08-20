# README

## New Chips Used

### Instruction Memory (ROM)

	- The ROM is pre-loaded with a program 
	- The ROM chip always outputs a 16-bit number
	- This number should be the current instruction

address(15-bit) --> ROM32K --> output(16-bit)


### Memory (RAM)

consists of:
	- Data memory (RAM16K)
	- Screen (memory map)
	- Keyboard (memory map)

Should be able to read and write information to memory.

Data memory: address (mandatory 15-bit), in (optional write 16-bit input), load (load input to memory boolean) --> RAM16K --> output (16-bit)
Screen: address (mandatory 15-bit), in (optional write 16-bit input), load (load input to memory boolean) --> RAM16K --> output (16-bit)
Keyboard: scan-code (16-bit value) of currently pressed key or zero if no key is pressed.

The Screen is 256 x 512 pixels in size, black and white. To set a pixel to black or white with the screen you must set the value of the bit located in Screen[row * 32 + col / 16]. Each screen row is 32 consecutive words of memory.

For example:

Finding row=0 and column=16:
```
	screen: 16384 (where screen starts in memory)
	row: 	0 	  (r*32)
	word:	1	  (c/16)
	---------------------------------------------
	Memory address = 16385
```
Finding row=12, column=345:
```
	screen: 16384
	row:	384
	word: 	21
	---------------------------------------------
	Memory address = 16789
```

To set a pixel to black set the word value to -1 (1111 1111 1111 1111) or 0 (0000 0000 0000 0000)



### CPU

### Computer