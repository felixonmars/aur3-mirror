# Contributor: Joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Mostafa Razavi <hom.sepanta@gmail.com>
# Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=screen-vs-long-term
pkgver=4.0.3
pkgrel=5
pkgdesc="Terminal multiplexing window manager, with vertical split patch, and long term"
arch=('i686' 'x86_64')
provides=('screen')
conflicts=('screen')
license=(GPL)
backup=('etc/skel/.screenrc' 'etc/screenrc')
install=screen.install
depends=('ncurses' 'pam')
backup=('etc/screenrc' 'etc/pam.d/screen')
url=http://fungi.yuggoth.org/vsp4s/
source=("ftp://www.mirrorservice.org/sites/ftp.gnu.org/gnu/screen/screen-${pkgver}.tar.gz"
        "http://vsp4sdl.yuggoth.org/wrp_vertical_split_0.3_4.0.2.diff.bz2"
        "http://projects.archlinux.org/svntogit/packages.git/plain/screen/trunk/screen-4.0.3-long-term.patch"
        'screen-256color.ti' 'screen.pam')
md5sums=('8506fd205028a96c741e4037de6e3c42' '483efadbe6d8e13cafc8bc4f5cf8db99'
         '2723c3e71d5a2e5a74b6ddbc5215ef0f'
         'ec2c96034f1245b1bc15211a825f2584' '74f7919d7b65436cc2ea5341fa8ca374')

build() {
    export LDFLAGS="${LDFLAGS} -Wl,--as-needed"
    _ptygroup=5
    cd ${srcdir}/screen-${pkgver}
  
    patch -Np1 < ../wrp_vertical_split_0.3_4.0.2.diff || return 1
    patch -Np1 < ../screen-4.0.3-long-term.patch || return 1

    ./configure --prefix=/usr --enable-pam \
        --with-sys-screenrc=/etc/screenrc --enable-colors256 \
        --enable-rxvt_osc --with-pty-group=$_ptygroup \
        --mandir=/usr/share/man --infodir=/usr/share/info || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    install -Dm644 etc/etcscreenrc ${pkgdir}/etc/screenrc
    install -Dm644 etc/screenrc ${pkgdir}/etc/skel/.screenrc
    install -Dm644 ${startdir}/screen.pam ${pkgdir}/etc/pam.d/screen

    install -Dm644 ${startdir}/screen-256color.ti ${pkgdir}/usr/share/screen/
    install -Dm644 etc/completer.zsh ${pkgdir}/usr/share/zsh/site-functions/screen

    rm -f ${pkgdir}/usr/share/info/dir
    gzip -9 ${pkgdir}/usr/share/info/*
}