pkgname=syck-for-pysyck
pkgver=0.61
pkgrel=1
pkgdesc="Unofficial syck built from svn+patches"
url="http://pyyaml.org/wiki/PySyck"
license=""
depends=()
makedepends=()
conflicts=('syck')
replaces=('syck')
backup=()
install=
source=(http://pyyaml.org/download/pysyck/syck-${pkgver}+svn231+patches.tar.gz)
md5sums=(66513c7b458bdadf12c97899eb33be67)

build() {
  cd $startdir/src/syck-${pkgver}+svn231+patches 
  ./configure --prefix=/usr
  make || return 1
  make check || return 1
  make DESTDIR=$startdir/pkg install
}
