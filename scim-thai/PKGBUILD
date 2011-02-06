# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=scim-thai
pkgver=0.1.1
pkgrel=2
pkgdesc="SCIM-Thai is SCIM IMEngine module for Thai language, based on libthai library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('scim')
source=(ftp://linux.thai.net/pub/thailinux/software/libthai/$pkgname-$pkgver.tar.gz)
url="http://linux.thai.net/projects/scim-thai"
options=('!libtool')
md5sums=('caa84f54fedf4fe1bcf50dfe69ec112d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

