# Maintainer: hbdee <hbdee.arch@gmail.com>
# Contributor: Wang Shouju <TheThirdGhost[AT]gmail[DOT]com>

pkgname=reciteword
pkgver=0.8.5
pkgrel=2
pkgdesc="Education software to help people study English by reciting English words."
arch=('i686' 'x86_64')
url="http://reciteword.sourceforge.net/index_en.html"
license=("GPL")
depends=('gtk2' 'perl-xml-parser' 'esound' 'espeak')
optdepends=('reciteword-books: book files'
	    'reciteword-dicts: dictionary files'
	    'reciteword-skins-rw: extra skin files'
	    'wyabdcrealpeopletts: sound files for speech')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('36a146393616158ef6a56f5b3f668274')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
