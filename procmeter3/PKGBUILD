# Maintainer: jmf <jmf at mesecons dot net>
# Contributor: Macfly

pkgname=procmeter3
pkgver=3.6+svn387
pkgrel=2
pkgdesc="A system status monitor for Linux with X-Windows, displays system resource usage in multiple graphs."
url="http://www.gedanken.org.uk/software/procmeter3/"
license=(GPL)
depends=('gtk2' 'gtk3' 'libxaw')
arch=('any')
source=(http://www.gedanken.org.uk/software/procmeter3/download/procmeter3-3.6+svn387.tgz)
md5sums=('1f3a46d9bad4de361f2adbffbdec767c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's!INSTDIR=/usr/local!INSTDIR='$pkgdir'/usr!g' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}
