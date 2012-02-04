# Contributor: Alex Muravya <asm at sfw dot su>

pkgname=fbe
pkgver=0.1
pkgrel=1
pkgdesc="Few Bash Extensions"
arch=('i686' 'x86_64')
url="http://sfw.su/repo/$pkgname/src/$pkgname-$pkgver.tar.bz2"
license=('GPL')
groups=()
depends=('bash')
makedepends=()
optdepends=()
provides=('fbe')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://sfw.su/repo/$pkgname/src/$pkgname-$pkgver.tar.bz2)
md5sums=('03552581d4d561604e8a2b339b8ca90b')
build() {
  cd $srcdir/$pkgname
  cp ./func /usr/bin || return 1
}
 
