# Mainainer: Alex Suykov <axs@ukr.net>
#
# This is "light" package, Kochi-Mincho is NOT included
# See PKGBUILD for u2ps itself on *map updating
#
# Note: due to makepkg limitations, you'll have to install u2ps
# main package before building this.

pkgname=u2ps-freemono
pkgver=0.8.1
pkgrel=3
pkgdesc="FreeMono font set for u2ps (w/o Kochi-Mincho)"
arch=('i686' 'x86_64')
url="http://u2ps.berlios.de"
license=('GPL')
groups=()
depends=(u2ps)
makedepends=()
provides=()
conflicts=(u2ps-freemono-kochi)
replaces=()
backup=()
options=()
install=$pkgname.install
source=(http://download.berlios.de/u2ps/u2ps-freemono-$pkgver.tar.gz\
  u2ps-freemono.install)
noextract=()
md5sums=('788c8e9ac70ed1a4fa8625db4e1518d2'
         '5f46c36c1bbd7077881c04a794c3f20e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/u2ps/ps
  mv Fontmap Fontmap.freemono
  mv resmap resmap.freemono
}

# vim:set ts=2 sw=2 et:
