FROM huaixiaoz/linux:my

LABEL maintainer "hello@ifnot.cc"

RUN pacman --noconfirm -Syu \
  nodejs npm go ruby \
  && rm -f \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /README \
        /etc/pacman.d/mirrorlist.pacnew
