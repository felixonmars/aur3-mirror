pkgname=spiceopus
pkgver=2.3
pkgrel=1
pkgdesc="General purpose circuit simulator"
url="http://www.spiceopus.si/"
depends=('')
arch=('i686' 'x86_64')
license=('Copyrighted by University of Ljubljana, Slovenia')
source=($url/download/spice_opus23_linux.tar.gz)
md5sums=('b4445e0bc5b812203796ee8abdac2894')

build() {
  cd spice_opus23_linux_18.Jan.2010_08.57
  sed -i -e '/root/d'  \
    -e '/install.*src/d' \
    -e '/tar.*src/d' \
    -e '/chmod.*src/d' install
  if [ ! -d ../../pkg ]; then
    mkdir ../../pkg
  fi
  ./install ../../pkg
}
