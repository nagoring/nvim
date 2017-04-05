let g:neomake_verbose=3
let g:neomake_logfile='~/tmp/neomake.log'
autocmd! BufWritePost * Neomake 
let g:neomake_javascript_enabled_makers = ['eslint']
