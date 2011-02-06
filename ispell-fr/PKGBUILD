# Contributor: e.samovar <e.samovar@gmail.com>

pkgname=ispell-fr
pkgver=1.0
pkgrel=1
pkgdesc="French dictionary for ispell"
url="http://www.gutenberg.eu.org/distributions/6-francais-gutenberg.html"
license="GPL"
depends=()
makedepends=('ispell')
conflicts=()
replaces=()
backup=()
install=
source=(http://www.gutenberg.eu.org/IMG/gz/francais-gutenberg-v$pkgver.tar.gz)
md5sums=('2c76980419efb6bda122a5e0e85c9247')

build() {
  cd $startdir/src/Francais-GUTenberg-v1.0
  cat dicos/*.dico | sort > francais.dico
  buildhash francais.dico francais.aff francais.hash
  buildhash francais.dico francais-TeX8b.aff francais-TeX8b.hash
  
  #Installing files 
  mkdir -p "$startdir/pkg/usr/lib/ispell"
  cp francais.aff francais.hash "$startdir/pkg/usr/lib/ispell"
  cp francais-TeX8b.aff francais-TeX8b.hash "$startdir/pkg/usr/lib/ispell"
}
