# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xarchive
pkgver=0.2.8_6
pkgrel=5
pkgdesc="XArchive is a generic front-end that uses external wrappers around command line archiving tools."
arch=('i686' 'x86_64')
url="http://xarchive.sourceforge.net/"
license="GPL"
#options=('docs')
depends=('gtk2')
install=xarchive.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver/_/-}.tar.gz")
md5sums=('e8df5149477d2ca92d4acca515d60005')

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  make DESTDIR="${pkgdir}" install
}
