# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=prime-dict
pkgver=0.8.7
pkgrel=2
_filecode=13191
pkgdesc="PRIME IMEngine dictionary"
arch=("i686" "x86_64")
url="http://taiyaki.org/prime/"
license=('GPL2')
depends=('prime>=1.0.0')
options=('!libtool')
source=(http://osdn.dl.sourceforge.jp/prime/${_filecode}/${pkgname}-${pkgver}.tar.gz)
md5sums=('96250130be67a185ed41c1632a89e5eb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var|| return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1  
}
