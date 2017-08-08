FROM huaixiaoz/linux:my

LABEL maintainer "hello@ifnot.cc"

## enable multilib repo, add multilib support
# Add multilib repo
RUN  sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/#//' /etc/pacman.conf && \
    sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/#//' /etc/pacman.conf && \
    sed -i 's/#\[multilib\]/\[multilib\]/g' /etc/pacman.conf

RUN yes y$'\n'y$'\n' | pacman  -Syu gcc-multilib \
  && pacman --noconfirm -Syu \
  nodejs npm gulp go rust \
  && rm -rf \
        /usr/share/man/* \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /README \
        /etc/pacman.d/mirrorlist.pacnew
