# Maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=fltk13
_realname=fltk
pkgver=1.3.0rc6
pkgrel=1
pkgdesc="Graphical user interface toolkit for X"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.fltk.org/"
depends=('libjpeg' 'libpng' 'gcc-libs' 'libxft' 'libxinerama')
optdepends=('bash: to use fltk-config')
makedepends=('mesa')
source=("http://ftp.easysw.com/pub/$_realname/$pkgver/$_realname-$pkgver-source.tar.gz")
md5sums=('f055f9984c37713cdd0a9f9546b9d7da')
provides=('fltk')
conflicts=('fltk')

build() {
  cd "$srcdir/$_realname-$pkgver"
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make || return 1
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR=${pkgdir} install
  chmod 644 ${pkgdir}/usr/lib/*.a
}
