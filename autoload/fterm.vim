let g:ft_py = "py3 "
exec g:ft_py "import vim, sys, os, re, os.path"
exec g:ft_py "cwd = vim.eval('expand(\"<sfile>:p:h\")')"
exec g:ft_py "cwd = re.sub(r'(?<=^.)', ':', os.sep.join(cwd.split('/')[1:])) if os.name == 'nt' and cwd.startswith('/') else cwd"
exec g:ft_py "sys.path.insert(0, os.path.join(cwd, 'fterm', 'python'))"

exec g:ft_py "from fterm.utils import *"
exec g:ft_py "from fterm.manager import *"

function! fterm#py(cmd) abort
  exec g:ft_py "".cmd
endfunction

function! fterm#cmd(...) abort
  exec g:ft_py "manager.start(vimeval('a:000'))"
endfunction

function! fterm#complete(A, L, P) abort
  return ['new', 'toggle', 'kill', 'select', 'settitle', 'move']
endfunction

function! fterm#set_title() abort
  echohl WarningMsg
  let title = input('title: ')
  echohl None
  exec "FtermSetTitle ".title
endfunction

function! fterm#async_runner(opts) abort
  exec g:ft_py "manager.async_run()"
endfunction
