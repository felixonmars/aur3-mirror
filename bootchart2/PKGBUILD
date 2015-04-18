# Contributor: JohnTheKipper <roteocktober@hotmail.com>
# Contributor: aaditya <aaditya_gnulinux@zoho.com>

pkgname=bootchart2
_pkgname=bootchart
pkgrel=1
pkgver=0.14.7
pkgdesc="Boot process visualization"
arch=('i686' 'x86_64')
url="http://github.com/mmeeks/bootchart"
license=('GPL')
conflicts=('bootchart2-git' 'bootchart')
depends=('python-cairo')
optdepends=('busybox' 'pygtk')
source=("https://github.com/mmeeks/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5a5314dec211fe07f3adf6c62e924eb7')
install=$pkgname.install
 
build() {
  cd "$_pkgname-$pkgver"
  make
}
 
package() {
  cd "$_pkgname-$pkgver"
  make EARLY_PREFIX=/usr DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin/bootchartd" "$pkgdir/usr/bin/bootchartd"
  rmdir "$pkgdir/usr/sbin"
}
