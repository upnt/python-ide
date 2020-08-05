FROM upnt/docker-neovim

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

# install neovim
RUN apk update && \
    apk add --update --no-cache --virtual .builddeps curl gcc \
            linux-headers musl-dev && \
    python3 -m pip install 'python-language-server[all]' flake8 && \
# install dein.vim
    curl -sf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && \
    sh ./installer.sh ~/.cache/dein && \
# remove
    rm ./installer.sh && \
    apk del --purge .builddeps

COPY nvim /root/.config/nvim
RUN nvim -c "call dein#install()" -c UpdateRemotePlugins -c q!

ENTRYPOINT ["nvim"]
