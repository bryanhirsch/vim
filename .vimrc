" BH
"
" misc notes:
"  - find trailing whitespace:          /\s\+$
"  - delete all trailing whitespace:    :%s/\s\+$//
"
"
set backspace=indent,eol,start
set number
set incsearch
syntax on
" intent 
noremap < <gv
noremap > >gv
" mapping
map fp :syntax enable<enter>:set syntax=php<enter>
map fr :syntax enable<enter>:set syntax=ruby<enter>
map fj :syntax enable<enter>:set syntax=javascript<enter>
map fh :syntax enable<enter>:set syntax=html<enter>
map ft :syntax enable<enter>:set syntax=text<enter>
map snon :set nonumber
map sn :set number
map f0 :set foldcolumn=0
map f4 :set foldcolumn=4
map tw0 :set textwidth=0
map tw80 :set textwidth=80
map sp :set paste
map snp :set nopaste


" fold
set foldcolumn=4
set foldmethod=indent
set textwidth=80

" Drupal
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Vim autocomplete
" .vim/plugin/word_complete.vim
" downloaded from http://www.vim.org/scripts/download_script.php?src_id=6504
" (from Vim Hacks 101 p 153)
" enable manually like this: 
"   :call DoWordComplete()
" disable manually like this:
"   :call EndWordComplete()
":autocmd BufEnter * call DoWordComplete()

" Vim popup autocomplete
" This plugin does Omni completion for HTML, XHTML, CSS, Ruby, Python. (PHP?)
" (Vim Hacks 101, p 151)
" Invoke autocomplete suggestions like this: 
"   When you're on a work you want to autocomplete do <ctrl>x<ctrl>o
"
" Turn on auto popup with this
" http://www.vim.org/scripts/download_script.php?src_id=11538
"   :AcpEnable
" see Vim Hacks 101, p 149
" filetype plugin on

" More autocomplete (although this may be redundant with the previous
" command).
"
" Use <ctrl>x<ctrl>o
"
" http://www.wretch.cc/blog/peicheng/13609844
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


" Languages that don't have Omni-Complete functions available can use their
" syntax highlighting definitions to achieve a similar affect. The Vim
" documentation suggests adding the following stanza to your vimrc, addin
" after any :filetype command, to enable Omni-Completion using the best available
" method (below).
" To use Omni-Completion hit Ctrl+x Ctrl+o to be presented with a list of
" choices for the text behind the cursor.
"
" Apart from programming languages, Omni-Completion also works for HTML and
" CSS. For example, you can type <p cl, Ctrlx Ctrl+o, then be shown class="
" CDATA, onclick=" Script, and ondblclick=" Script.
" http://vim.runpaint.org/typing/auto-completing-text/
if has("autocmd") && exists("+omnifunc")            
  autocmd Filetype *
  \   if &omnifunc == "" |
  \     setlocal omnifunc=syntaxcomplete#Complete |
  \   endif
endif

" Get Drupal functions
" http://treslerdesigns.com/node/9
" 
" Note: These instructions should actually say to get the developer docs like this:
" cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal-contrib
" checkout -r DRUPAL-6--1 -d developer-docs contributions/docs/developer
" (see http://drupal.org/node/425944)
"
" Does this work? I can't get :ta or :ts to do anything.
"
" This taglist plugin works great: 
" http://www.thegeekstuff.com/2009/04/ctags-taglist-vi-vim-editor-as-sourece-code-browser/
" Use:
" - Open tag list with :TlistOpen
" - Hover over a tag in the tag list, Ctrl+T open a new tab at that item
" - Hover over a tag in the tag list, enter jumps to that item
" But this doesn't depend on any of this stuff below.
 if has("autocmd")
"   " Drupal *.module and *.install files.
   augroup module
   autocmd BufRead,BufNewFile *.module set filetype=php
   autocmd BufRead,BufNewFile *.install set filetype=php
   set tags=~/.vim/drupal6.tags
   augroup END
 endif

" Use hook list from file generated above as a thesaurus.
" set thesaurus+=~/.vim/drupal6hooks.txt

" Create a dictionary of functions in a drupal installation like this: 
"   grep "^function" modules/ includes/ -hR | gawk '{ sub(/\(.+/, "(", $2);
"   print $2 }' | sort -u > ~/.vim/dictionaries/drupal6.dict
" Then tell .vimrc to look at this dictionary (see below). Use <ctrl>x<ctrl>k
" to call up option list.
" http://www.thingy-ma-jig.co.uk/blog/18-08-2009/drupal-autocomplete-vim
" set dict +=~/.vim/dictionaries/drupal6.dict
