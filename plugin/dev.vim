function! ReloadAlpha()
lua << EOF
    for k in pairs(package.loaded) do 
        if k:match("^openai_nvim") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction

" Reload the plugin
nnoremap <localleader><localleader>r :call ReloadAlpha()<CR>
" Test the plugin
nnoremap <Leader>a :lua require("openai_nvim").send_current_line()<CR>
vnoremap <Leader>a :lua require("openai_nvim").send_visual_selection()<CR>



