FROM base/archlinux:latest

LABEL maintainer "hello@ifnot.cc"

## Install base-devel
RUN    pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman --noconfirm -Syu --needed base-devel \
    && rm -f \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

## Install packages
RUN pacman --noconfirm -Syu \
  openssh vim cloc nasm gnu-netcat htop tree iproute2 net-tools pciutils \
  libaio \
  && rm -f \
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

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
