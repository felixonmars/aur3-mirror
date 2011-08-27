# $Id: PKGBUILD,v 1.8 2004/10/13 19:38:55 aurelien Exp $
# Maintainer: ???
# Contributor: Flemming Madsen (arch at themadsens dot dk)
pkgname=glimpse
pkgver=3.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Fast full text search and indexing with approximate matching"
url="http://webglimpse.org"
license="BSD style"
depends=('glibc')
source=(ftp://ftp.cs.tu-berlin.de/pub/linux/Mirrors/sunsite.unc.edu/utils/text/glimpse-${pkgver}.src.tgz \
        compile.patch)
md5sums=('7442265f2fd952dcc72d20bf605c9427'
         'abdf7995941efb8bea3237c20872e069')


build() {
  cd $startdir/src/$pkgname-${pkgver}.src
  [ "$NOEXTRACT" == 1 ] || patch --backup -p0 < ../compile.patch
  [ "$NOEXTRACT" == 1 ] || ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
