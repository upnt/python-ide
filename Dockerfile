FROM upnt/docvim-pyenv

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

RUN apk update && \
    apk add --no-cache git && \
    git clone https://github.com/upnt/dotfiles && \
    cd dotfiles && \
    bash init.sh && \
    bash deploy.sh nvim && \
    bash deploy.sh bash && \
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
