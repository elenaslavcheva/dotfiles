call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/molokai'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'stephpy/vim-yaml'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'saltstack/salt-vim'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Shougo/echodoc.vim'
Plug 'pearofducks/ansible-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'ekalinin/Dockerfile.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

filetype plugin indent on
set nocompatible
set encoding=utf-8
set cursorline
set number
set ts=2 sw=2 et
set autoindent
set mouse-=a
set incsearch
set nohlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set laststatus=2
set t_Co=256
set t_ut=
set termguicolors
set completeopt=longest,menuone,preview
set autowrite
set spell spelllang=en_us

syntax on
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

let mapleader = ","
inoremap jj <ESC>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
map <leader>p :Files<CR>
map <leader>g :GFiles<CR>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

map <leader>r :GGrep<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
map <leader>f :NERDTreeToggle<CR>

map <leader>e :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_yaml_checkers = ['jsyaml']

let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#pointer = 1

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_term_enabled = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('ternjs',        'mark', '⌁')
call deoplete#custom#source('jedi',          'mark', '⌁')
call deoplete#custom#source('vim',           'mark', '⌁')
call deoplete#custom#source('neosnippet',    'mark', '⌘')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('tmux-complete', 'mark', '⊶')
call deoplete#custom#source('vim',           'rank', 630)
call deoplete#custom#source('ternjs',        'rank', 620)
call deoplete#custom#source('jedi',          'rank', 610)
call deoplete#custom#source('omni',          'rank', 600)
call deoplete#custom#source('neosnippet',    'rank', 510)
call deoplete#custom#source('member',        'rank', 500)
call deoplete#custom#source('file_include',  'rank', 420)
call deoplete#custom#source('file',          'rank', 410)
call deoplete#custom#source('tag',           'rank', 400)
call deoplete#custom#source('around',        'rank', 330)
call deoplete#custom#source('buffer',        'rank', 320)
call deoplete#custom#source('dictionary',    'rank', 310)
call deoplete#custom#source('tmux-complete', 'rank', 300)
call deoplete#custom#source('syntax',        'rank', 200)
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.j2 set filetype=yaml
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=ansible
au BufRead,BufNewFile Jenkinsfile set filetype=jenkinsfile
autocmd Filetype go set ts=4 sw=4 et
autocmd FileType go nmap <leader>r <Plug>(go-run-tab)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>d <Plug>(go-doc)
autocmd FileType java setlocal ts=4 sw=4 omnifunc=javacomplete#Complete
autocmd FileType groovy setlocal ts=4 sw=4
autocmd FileType jenkinsfile setlocal ts=4 sw=4
autocmd Filetype yaml set ts=2 sw=2 et
autocmd Filetype ansible set ts=2 sw=2 et
autocmd FileType terraform setlocal commentstring=#%s
autocmd FileType make setlocal noexpandtab

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
