# Maintainer: Alex Suykov <axs@ukr.net>
#
# This is complete FreeMono fset
#
# Note: due to makepkg limitations, you'll have to install u2ps
# main package before building this.

pkgname=u2ps-freemono-kochi
_pkgname=u2ps-freemono
pkgver=0.8.1
pkgrel=3
pkgdesc="FreeMono font set for u2ps (with Kochi-Mincho)"
arch=('i686' 'x86_64')
url="http://u2ps.berlios.de"
license=('GPL')
groups=()
depends=(u2ps)
makedepends=()
provides=()
conflicts=(u2ps-freemono)
replaces=()
backup=()
options=()
install=$_pkgname.install
source=(http://download.berlios.de/u2ps/u2ps-freemono-$pkgver.tar.gz\
  http://download.berlios.de/u2ps/u2ps-freemono-kochi-$pkgver.tar.gz\
  u2ps-freemono.install)
noextract=()
md5sums=('788c8e9ac70ed1a4fa8625db4e1518d2'
         '57c0a1468f1d9c125b5152ad462f1492'
         '5f46c36c1bbd7077881c04a794c3f20e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/u2ps/ps
  mv Fontmap Fontmap.freemono
  mv resmap resmap.freemono
}

# vim:set ts=2 sw=2 et:
