FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm docker
RUN pacman -S --noconfirm base-devel
# RUN pacman -S --noconfirm docker
RUN pacman -S --noconfirm git curl starship sheldon
RUN useradd -m kamijodev
RUN usermod -aG wheel kamijodev
USER kamijodev
WORKDIR /home/kamijodev
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0 && \
    . "$HOME/.asdf/asdf.sh" && \
    asdf plugin add golang && \
    asdf install golang 1.21.0 && \
    asdf global golang 1.21.0 && \
    export GOPATH="$(go env GOROOT)"
    # echo "-----" && \
    # go version && \
    # git clone https://aur.archlinux.org/yay.git && \
    # cd yay && \
    # makepkg -si
# RUN echo "export GOPATH=$(go env GOPATH)" >> $HOME/.bashrc
