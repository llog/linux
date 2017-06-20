FROM base/archlinux:latest

LABEL maintainer "hello@ifnot.cc"

RUN    pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman --noconfirm -Syu --needed base-devel \
    && rm -f \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

CMD ["/bin/bash"]
