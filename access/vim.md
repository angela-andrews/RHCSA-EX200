# VIM
Vim has serveral modes to operate in.
* Normal (Command) Mode:
  - No mode listed in lower left corner
  - Where you can use keystroke commands and navigate with keys like h,j,k,l 
* Extended Command Mode:
  - Prefaces by colon in lower-left corner
* Insert Mode:
  - Where you can type your text
* Visual Mode
  - v
  - Mark the start of the text for editing
* Visual Line Mode: 
  - shift+v
  - Use arrow keys to select lines of text for editing
* Visual Block Mode
  - ctrl+v
  - Use arrow keys to select blocks of text for editing/deleting


## Common VIM commands and keystrokes

**Command mode:**
* i -insert text before the cursor
* v - visual mode
* Shift+ A - append text after the line
* ESC - exit mode
* Shift + ZZ - save and exit
* yy - yank text 
* p - paste from buffer
* dd - delete/cut line
* x - delete character under cursor
* ESC : - enter extended command mode
* h - move cursor to the left
* j - move cursor down (jump down)
* k - move cursor up (kick up)
* l - move cursor to the right
* dw - delete word

**Extended Command Mode:**
* :w - write
* :w _filename_ - write file with this name
* :q - quit
* :wq - write and quit
* :# - go to line #