# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname='ctalk'
pkgver='0.0.96a'
_pkgver='0.0.96a-20100827'
pkgrel='2'
pkgdesc='An object oriented extension to the C language'
arch=('i686' 'x86_64')
url='http://www.ctalklang.org/'
license=('GPL3')
options=('!libtool')
depends=('libxt' 'sh')

md5sums=('5fa586bd96f906b1fbe76928463d9039')
source=("${url}files/$pkgname-$_pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-0.0.96"
  ./configure --prefix=/usr
  make; make DESTDIR=$pkgdir install
}
