# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

# Original PKGBUILD (extra/exo):
# $Id: PKGBUILD 172469 2012-12-03 11:51:15Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=exo-devel
_pkgname=exo
pkgver=0.10.0
pkgrel=1
pkgdesc="Extensions to Xfce by os-cillation"
arch=('i686' 'x86_64')
url="http://www.xfce.org/projects/exo"
license=('GPL2' 'LGPL')
groups=('xfce4')
depends=('libxfce4ui' 'gtk2' 'hicolor-icon-theme' )
makedepends=('perl-uri' 'intltool' 'gtk-doc' 'xorg-iceauth')
optdepends=('perl-uri: for mail-compose helper script')
options=('!libtool')
install=$_pkgname.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/0.10/$_pkgname-$pkgver.tar.bz2)
sha256sums=('bd5342f5d56a86521315d3ed5834973f28ab58d4f3d76351b590bebbb87afc66')

groups=('xfce4-devel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Python 2 fix
  export PYTHON=python2

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
