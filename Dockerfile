FROM upnt/base-ide

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

RUN apk update && \
    python  -m pip install -U pip && \
    python3 -m pip install -U pip && \
    python  -m pip install pipenv && \
    python3 -m pip install pipenv && \
    python  -m pip install jedi && \
    python3 -m pip install jedi && \
# add plugins
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'davidhalter/jedi-vim'" >> ~/.config/nvim/dein.toml && \
    echo "hook_add = 'let g:jedi#completions_enabled = 0'" >> ~/.config/nvim/dein.toml && \
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'Vimjas/vim-python-pep8-indent'" >> ~/.config/nvim/dein.toml && \
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'zchee/deoplete-jedi'" >> ~/.config/nvim/dein.toml && \
# install plugins
    nvim -c "call dein#install()" -c UpdateRemotePlugins -c q!

ENTRYPOINT ["nvim"]
