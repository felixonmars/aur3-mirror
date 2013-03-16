# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname='id3tool'
pkgver='1.2a'
pkgrel='3'
pkgdesc='A command line editor for ID3 tags in MP3 files'
arch=('i686' 'x86_64')
url='http://nekohako.xware.cx/id3tool/'
license=('GPL')

md5sums=('061185562c0d0e6327406d9fc2f194b2')
source=("$url$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make; make DESTDIR=$pkgdir install
}
