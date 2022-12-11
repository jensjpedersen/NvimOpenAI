if exists('g:loaded_alpha') | finish | endif " prevent loading file twice
let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults
" command to run our plugin
command! AISendLine lua require("openai_nvim").send_current_line()
command! AISendVisual lua require("openai_nvim").send_visual_selection()
let &cpo = s:save_cpo " and restore after
unlet s:save_cpo
let g:loaded_alpha = 1
