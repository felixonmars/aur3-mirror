# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=suikyo
pkgver=2.1.0
pkgrel=1
pkgdesc="A romaji to hiragana conversion library"
arch=("i686" "x86_64")
url="http://taiyaki.org/suikyo/"
license=('GPL2')
depends=('ruby')
options=('!libtool')
source=(http://prime.sourceforge.jp/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('d33d713c57522f5c28323e19b3f635b2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var|| return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
