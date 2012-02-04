# Contributor: napa3um <napa3um@gmail.com>
pkgname=rdesktop-raw
pkgver=1.6.0
pkgrel=2
provides=(rdesktop)
conflicts=(rdesktop)
depends=('libx11' 'openssl' 'libao' 'libsamplerate')
pkgdesc="Client for connect to Windows Terminal Servers. Version with RawKeyboard support (use -y)."
license=('GPL')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/rdesktop/rdesktop-$pkgver.tar.gz \
    rdesktop.c.diff \
    scancodes.h.diff \
    xkeymap.c.diff \
    xwin.c.diff \
    man.diff)
url="http://www.rdesktop.org/"
build() {
   cd $startdir/src/rdesktop-$pkgver
   patch -Np1 -i $startdir/rdesktop.c.diff || return 1
   patch -Np1 -i $startdir/scancodes.h.diff || return 1
   patch -Np1 -i $startdir/xkeymap.c.diff || return 1
   patch -Np1 -i $startdir/xwin.c.diff || return 1
   patch -Np1 -i $startdir/man.diff || return 1
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
md5sums=('c6fcbed7f0ad7e60ac5fcb2d324d8b16')
