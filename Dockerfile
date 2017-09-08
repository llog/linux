FROM base/archlinux:latest

LABEL maintainer "hello@ifnot.cc"

## Install base-devel
RUN    pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman --noconfirm -Syu --needed base-devel \
    && rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

## Install packages
ENV TERM xterm
RUN pacman --noconfirm -Syu \
  openssh vim neovim cloc gnu-netcat htop tree iproute2 net-tools pciutils wget zsh aria2 \
  git cmake ninja python python-pip ruby lua nasm yasm clang llvm\
  libaio libzip lbzip2 \
  jdk8-openjdk \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
  && mkdir ${HOME}/.config \
  && curl -sLf https://spacevim.org/install.sh | sh \
  && rm -rf \
        /usr/share/man/* \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /README \
        /etc/pacman.d/mirrorlist.pacnew

#CMD ["/bin/bash"]
RUN /usr/bin/ssh-keygen -A \
 && sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config \
 && echo 'root:root' | chpasswd

VOLUME ["/codes"]
VOLUME ["/images"]

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
