# Contributor: linuxSEAT <--put_my_name_here--@gmail.com> 

pkgname=bulk_extractor
pkgver=1.5.5
pkgrel=1
pkgdesc="Bulk Email and URL extraction tool"
arch=('i686' 'x86_64')
url="http://afflib.org"
license=('GPL')
depends=('expat' 'sqlite' 'tre' 'java-environment')
optdepends=('libewf: for reading EnCase E01 evidence files'
            'afflib: for reading AFF evidence files'
            'exiv2: for decoding JPEG Exifs'
            'openssl: for crypto primitives')
            source=(http://digitalcorpora.org/downloads/bulk_extractor/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir install || return 1
}
md5sums=('7155ce6938876be91416def15e44d585')
