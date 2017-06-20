FROM base/devel:latest

LABEL maintainer "hello@ifnot.cc"

# RUN    pacman-key --init \
#     && pacman-key --populate archlinux \
#     && pacman --noconfirm -Syu --needed base-devel \
#     && rm -f \
#       /var/cache/pacman/pkg/* \
#       /var/lib/pacman/sync/* \
#       /README \
#       /etc/pacman.d/mirrorlist.pacnew

## Install packages
RUN pacman --noconfirm -Syu \
  openssh vim cloc nasm gnu-netcat htop tree \
  && rm -f \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /README \
        /etc/pacman.d/mirrorlist.pacnew

CMD ["/bin/bash"]
