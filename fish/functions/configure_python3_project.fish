function configure_python3_project
    virtualenv venv --python=/usr/bin/python3.5

    touch .session.vim

    rm .lvimrc
    touch .lvimrc

    echo "autocmd VimEnter * NERDTreeTabsOpen" >> .lvimrc
    echo "set wildignore+=*venv/*,*pyc" >> .lvimrc
    echo "let g:pydoc_cmd='python -m pydoc'" >> .lvimrc
end
