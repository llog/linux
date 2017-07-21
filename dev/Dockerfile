FROM huaixiaoz/linux:my

LABEL maintainer "hello@ifnot.cc"

## enable multilib repo
RUN cat > /etc/pacman.conf <<EOF

[community]
Include = /etc/pacman.d/mirrorlist
EOF

RUN pacman --noconfirm -Syu \
  nodejs npm gulp go ruby gcc-multilib \
  && rm -f \
        /usr/share/man/* \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /README \
        /etc/pacman.d/mirrorlist.pacnew
