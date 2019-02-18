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

    filetype plugin indent on
    syntax enable
    set background=light
    colorscheme solarized

    set spelllang=ru,en
    au BufRead *.md setlocal spell

    autocmd FileType nix setlocal shiftwidth=2 tabstop=2 expandtab

    map <F4> gg=G

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

    set foldmethod=syntax
  '';
}
