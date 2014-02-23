" unite-localrc - Unite.vim plugin to list localrc files.
" Version: 0.0.1
" Author : zeero <zeero26@gmail.com>

let s:save_cpo = &cpo
set cpo&vim


let s:unite_source = {
\   'name': 'localrc',
\ }

function! s:unite_source.gather_candidates(args, context)
  let candidates = localrc#search(get(g:, 'localrc_filename'))
  return map(candidates, '{
  \   "word": printf("%d: %s", v:key + 1, v:val),
  \   "source": "localrc",
  \   "kind": "file",
  \   "action__path": v:val,
  \   "action__line": v:key + 1,
  \ }')
endfunction

function! unite#sources#localrc#define()
  return exists('*localrc#search') ? s:unite_source : []
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

