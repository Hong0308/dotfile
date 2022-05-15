let large_file = 524288 " 512 KB
let this_size=getfsize(expand(@%))

if  this_size > large_file
    so ~/.vim/lite/.vimrc
else
    so ~/.vim/normal/.vimrc
endif

