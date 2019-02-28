{}:
{
  config = ''
    set nocompatible

    set backspace=indent,eol,start

    set nomodeline
    set autoread
    set clipboard=unnamedplus
    set splitright

    set encoding=utf-8

    set number
    set relativenumber
    set ruler
    set noshowmode

    if !has('packages')
        execute pathogen#infect('pack/plugins/start/{}', 'pack/themes/opt/{}')
    endif

    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'

    set noswapfile
    set undofile
    set undodir=~/.vim/undo

    set cindent
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

    let g:netrw_browse_split = 4
    let g:netrw_winsize = 25
    augroup ProjectDrawer
      au!
      au VimEnter * :Vexplore
    augroup END

    filetype plugin indent on
    syntax enable
    set background=light
    colorscheme solarized

    function! Run()
        if expand("%:e")=="cpp" || expand("%:e")=="cxx"
            !clang++ -std=gnu++17 -I. -Wall -Werror -lm  % -o %< && ./%<
        elseif expand("%:e")=="c"
            !clang -std=gnu99 -Wall -Wformat-security -Winit-self -Wno-pointer-sign -Wignored-qualifiers -Wfloat-equal -Wnested-externs -Wmissing-field-initializers -Wmissing-parameter-type -Wold-style-definition -Wold-style-declaration -Wstrict-prototypes -Wtype-limits -Wswitch-default -lm -O2 % -o ./%< && ./%<
        elseif expand("%:e")=="hs"
            !ghc % && ./%<
        endif
    endfunction

    map <F4> gg=G
    map <F5> :call Run()<CR>

    augroup Binary
        au!
        au BufReadPre  *.bin let &bin=1
        au BufReadPost * if &bin | %!xxd
        au BufReadPost * set ft=xxd | endif
        au BufWritePre * if &bin | %!xxd -r
        au BufWritePre * endif
        au BufWritePost * if &bin | %!xxd
        au BufWritePost * set nomod | endif
    augroup END

    let g:ycm_confirm_extra_conf = 0

    set foldmethod=syntax
  '';
}
