# $Id: PKGBUILD 71789 2010-03-09 16:23:42Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=scrot-focus
pkgver=0.8
pkgrel=5
pkgdesc="A simple command-line screenshot utility for X with focus patch"
arch=('i686' 'x86_64')
url="http://scrot.sourcearchive.com/"
license=('MIT')
depends=('giblib')
conflicts=('scrot')
provides=('scrot')
source=(ftp://ftp.archlinux.org/other/scrot/scrot-${pkgver}.tar.bz2 04-focused.dpatch)
md5sums=('6a02df0e3bb26ec578dfeb8f56a7b30d'
         'd8e0f22d92808aeb2f5a42e16821035a')

build() {
  cd $srcdir/scrot-$pkgver
  patch -p1 < ../04-focused.dpatch || return 1
  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir docsdir=/usr/share/doc/scrot install || return 1
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
