# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gts-snapshot
pkgver=121130
pkgrel=1
pkgdesc="A set of useful functions to deal with 3D surfaces meshed with interconnected triangles."
arch=(i686 x86_64)
url="http://gfs.sourceforge.net/wiki/index.php/Main_Page"
license=('GPL')
groups=('gerris')
depends=('netpbm' 'glib2')
provides=('gts')
conflicts=('gts')
source=("http://gts.sf.net/$pkgname.tar.gz")
md5sums=('SKIP')

pkgver() {
  ls -d $pkgname-* | cut -d"-" -f3
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
