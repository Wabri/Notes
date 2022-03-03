# LearningVim

[![Vim](https://www.vim.org/images/vim_header.gif)](https://www.vim.org/)

****I want to learn vim or I will die trying****

###### *I raccomend to use vimtutor as the best guide for vim*
###### *Whatever happens, remember to press `<ESC>` to return on Normal Mode*

## Install vim

**Debian/Ubuntu Distros (And more)**: `sudo apt install vim`

## Open a file

On a terminal write:
```
vim <path_to_file>
```
This will open the file you want to edit with vim.

## Vim Modes
VIM has three modes:
* Insert Mode- stuff you type is added to the buffer
* Normal Mode- keys you hit are interpreted as commands
* Visual Mode- allows you to select blocks of text

## Exit and save on Vim

###### **On Normal Mode**
--------------------------------------------------
Exit from vim:
```
:quit
```
or
```
:q
```
or
```
:exit
```
or
```
:x
```
or
```
ZZ or Shift+z+z
```
-------------------------------------------------
Exit without save (trash all changes):
```
:q!
```
--------------------------------------------------
Exit with save (save the changes):
```
:wq
```
--------------------------------------------------
Save changes made to the text:
```
:w
```
or save with filename:
```
:w <filename>
```
--------------------------------------------------

## Navigations and Motions

###### ***Tip1: Never use arrow keys.***


###### ***Tip2: When you are in Normal Mode you can execute vim commands. Press the `<ESC>` key to make sure you are in Normal Mode***


All the moves are intended to be use in **Normal Mode**.

```
To move the cursor, press the h,j,k,l keys as indicated.
             ^
             k              Hint:  The h key is at the left and moves left.
       < h       l >               The l key is at the right and moves right.
             j                     The j key looks like a down arrow.
             v
```
(Quote: [Vimtutor](#references))

The move from a character to another is called **motion**.

All the motions that you can use are:
* `h/j/k/l` - in order move left/down/up/right
* `w` - move to the start of the next word
* `e` - move to the end of the next word
* `b` - move to the previous word
* `$` - move to the end of the line
* `0` - move to the start of the line
* `W or Shift+w` - move to the start of the next word ignoring the special characters like parenthesis or commas.
* `E or Shift+e` - move to the end of the next word ignoring the special characters like parenthesis or commas.
* `B or Shift+b` - move to the previous word ignoring the special characters like parenthesis or commas.
* `f<character>` - is the forward motion to the first character specified.
* `F<character> or Shift+f<character>` - is the backward motion to the first character specified.
* `t<character>` - move forward until the first character specified.
* `T<character> or Shift+t<character>` - move backward until the first character specified.

There are several ways to repeats a motion:
* hold the motion key
```
<motion>
```
* or type a number before a motion to repeat
```
<number><motion>
```

For example: You want to move the cursor to the start of the third word ahead, you can type `3w`. In the same way you can move to the 10th line after the line where you are by type `10j`.

The default motion move with logical mode, if you want to move in graphical mode you need to use:
```
g<motion>
```

## Text Editing and Commands

###### **On Normal Mode**

--------------------------------------------------
Delete single focus character:
```
x
```
--------------------------------------------------
Delete more than one character:
```
<number>x
```
--------------------------------------------------
Delete operator (to know more go to [Operators](#operators) paragraph):
```
d<motion>
```
--------------------------------------------------
Enter in **Insert Mode** (insert before the cursor):
```
i
```
--------------------------------------------------
Enter in **Insert Mode** at the start of the line (to a non black character):
```
I or Shift+i
```
--------------------------------------------------
Enter in **Insert Mode** next to the character focused (append command):
```
a
```
--------------------------------------------------
Append text to the line focused (this will put you on **Insert Mode** at the end of the line of the character focused):
```
A or Shift+a
```
----------------------------------------------------
Enter in **Insert Mode** and delete the character focused:
```
s
```
----------------------------------------------------
Enter in **Insert Mode** and delete the entire line focused:
```
S or Shift+s
```
----------------------------------------------------
Create a new line below and enter in **Insert Mode**:
```
o
```
----------------------------------------------------
Create a new line above and enter in **Insert Mode**:
```
O or Shift+o
```
----------------------------------------------------
Replace single character:
```
r
```
---------------------------------------------------
Replace more then one character:
```
R or Shift+r
```
To exit from **Replace Mode** press `<ESC>`.

--------------------------------------------------
Undo last commands executed:
```
u
```
--------------------------------------------------
Undo a whole line and return the line to its original state:
```
U or Shift+u
```
--------------------------------------------------
Redo last commands, that is undo the undo's:
```
CTRL+r
```
You can keep CTRL key and hitting *r* a number of time to redo multiple times.

--------------------------------------------------
Put the previously deleted text after the cursor:
```
p
```
--------------------------------------------------
Replace command allows to insert a new character above the character focused:
```
r<new_character>
```
--------------------------------------------------
Show the position in the file and status of the file:
```
Ctrl+g
```
--------------------------------------------------
Move to the bottom of the file:
```
G or Shift+g
```
--------------------------------------------------
Move to the start of the file:
```
gg
```
--------------------------------------------------
Move to a defined line:
```
<number>G or <number>Shift+g
```
--------------------------------------------------
Search command:

*Forward direction*
```
/<string_to_search>
```
*Backward direction*
```
?<string_to_search>
```
To search for the same phrase again:
```
n
```
To search for the same phrase in the opposite direction:
```
N or Shift+n
```
When you find what you search just press:
```
Enter or Return
```
--------------------------------------------------
Return to the previous position:

*Forward direction*:
```
Ctrl+o
```
and *Backward direction*:
```
Ctrl+i
```
--------------------------------------------------
Mach parentheses search command:
```
%
```
This command will place the cursor on any *(*, *[*, *{* in the line below marked.

--------------------------------------------------
To substitute a word to a new one:
```
:s/<old_word>/<new_word>
```
This will change the first old_word found with the new_word.
To substitute this word on the entire of the line:
```
:s/<old_word>/<new_word>/g
```
To substitute *old_word* with *new_word* from line *x* to line *y*:
```
:<x>,<y>s/<old_word>/<new_word>/g
```
To substitute in the entire file:
```
:%s/<old_word>/<new_word>/g
```
To substitute in the entire file and ask for confirmation each time:
```
:%s/<old_word>/<new_word>/gc
```
--------------------------------------------------
Execute an external command:
```
:!<external_command>
```
--------------------------------------------------
Retrive command:
```
:r <filename>
```
This will retrive the contents of **filename** and place below the cursor line.
You can also retrive a command:
```
:r !<external command>
```
--------------------------------------------------
Enter in **Visual Mode**:
```
v
```
On visual mode you can select characters and lines with the motion keys. With the selection you can execute command (see below).

--------------------------------------------------

###### **On Visual Mode**
--------------------------------------------------
Delete selection:
```
d
```
--------------------------------------------------
Save the selection into a file to press:
```
:
```
Will appear something like:
```
:'<,'>
```
Now you need to set the write mode and a filename:
```
:'<,'>w <filename>
```
This will create a file with the selection.

--------------------------------------------------
To do a copy and paste you need to use yank command. First select some text in **Visual Mode** and then press:
```
y
```
Then you can paste the yanked text with:
```
p
```
To paste the yanked text before the cursor with:
```
P or Shift+p
```
--------------------------------------------------


## Operators

```
Many commands that change text are made from an operator and a motion.
```
(Quote: [Vimtutor](#references))

###### All the motions are in the [Navigation and motions](#navigation_and_motions) section.

**Format:**
```
<operator><motion>
```

--------------------------------------------------

###### **On Normal Mode**

Delete operator:

```
d<motion>
```
or
```
d[number]<motion>
```

There are several **motion** for the delete operator:
- `w` - delete until the start of the next word, excluding its first character.
- `e` - delete to the end of the current word, including the last character.
- `$` - delete to the end of the line, including the last character.
- `0` - delete from the start of the line to the character where the cursor is.
- To know all the motions go to [Navigations and motions](#navigations-and-motions)

You can delete from the cursor to the end of the line by use:
```
D or Shift+d
```
Like `d$`.

To delete the entire line you can use the command:
```
dd
```
Or delete more the 1 line:
```
<number>dd
```

--------------------------------------------------

Change operator:
```
c<motion>
```
or
```
c[number]<motion>
```

This operator delete the selection made with the motion and put you in the **Insert Mode**. It is something like delete and replace command.

It can be use all the motion, some example they can be:
- `w` - replace until the start of the next word, excluding its first character.
- `e` - replace to the end of the current word, including the last character.
- `$` - replace to the end of the line, including the last character.
- `0` - replace from the start of the line to the character where the cursor is.
- To know all the motions go to [Navigations and motions](#navigations-and-motions)

The `C or Shift+c` have the same purpose of `c$`.

--------------------------------------------------
Yank (copy) operator:
```
y<motion>
```
or
```
y[number]<motion>
```

This operator copy the selection made with the motion.

It can be use all the motion, some example they can be:
- `w` - copy until the start of the next word, excluding its first character.
- `e` - copy to the end of the current word, including the last character.
- `$` - copy to the end of the line, including the last character.
- `0` - copy from the start of the line to the character where the cursor is.
- To know all the motions go to [Navigations and motions](#navigations-and-motions)

There are a few more yank command:
- `yy` - yank the entire line

This operator is use with paste command:
```
p
```

## Vim configuration

Vim has many more features than Vi, bu most of them are disabled by default. To abilitate them is need a vimrc file.
To start editing the **vimrc** file (on Unix) you need to run this command:
```
:e ~/.vimrc
```
To get an example of vimrc you can run the retrive command of the vimrc_example into your .vimrc:
```
:r $VIMRUNTIME/vimrc_example.vim
```
For more information you can type:
```
:help vimrc-intro
```

## Vim command line completion

When you are in **Command Line Mode** you can use the completition with:
```
Ctrl+d
```
this will work for everything with file or command. You can press the `<TAB>` key to choose one of the completition.

--------------------------------------------------

## References

### First steps

* **Vimtutor**: you can easy run vimtutor from your terminal and get all the documentations and help of the vim editor. Simply run `vimtutor`
* [All you need to know is probably here](https://github.com/mhinz/vim-galore): A complete repository with all you need to know of vim and more
* Obviously this incompleted github repository

## Video

* **Video of [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg)**: [The Vim Tutorial - Part One - Basic Commands](https://www.youtube.com/watch?v=ER5JYFKkYDg)
* **Video of [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg)**: [The Vim Tutorial - Part Two - More Commands](https://www.youtube.com/watch?v=tExTz7GnpdQ)

## Books

- https://iccf-holland.org/vim_books.html

## Plugins

- [VimAwesome](https://vimawesome.com/)
- [Awesome-vim](https://github.com/akrawchyk/awesome-vim)

## Mailinglist

- [VimTricks](https://vimtricks.substack.com/)

