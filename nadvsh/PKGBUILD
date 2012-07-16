# Maintainer: Björn Bidar <theodorstormgrade@gmail.com>
# fixed the make file according to: http://www.freebsd.org/doc/en/books/porters-handbook/porting-prefix.html and https://wiki.archlinux.org/index.php/Creating_Packages#The_package.28.29_function
pkgname=nadvsh
pkgver=1.85.3
pkgrel=1
pkgdesc="New Adventure Shell"
arch=('any')
url="http://nadvsh.sourceforge.net/"
license=('GPL2')
depends=('sh')
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('b18a9c5060b6097dca440b27b387d0c7')



build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" PREFIX=${pkgdir}/usr 
}
