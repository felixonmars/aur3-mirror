# Contributor: Dale Ogilvie <pnyli0002@sneakemail.com>

pkgname=sword-python
pkgver=1.5.9
pkgrel=1
pkgdesc="Python bindings for SWORD"
arch=(i686 x86_64)
url="http://www.crosswire.org/sword/index.jsp"
license="GPL"
options=('!LIBTOOL')
depends=('sword' 'swig')
source=(http://www.crosswire.org/ftpmirror/pub/$pkgname/source/v1.5/sword-${pkgver}.tar.gz)
md5sums=('e1f1af8c2add8310d0bbcddc9af523b8')

build() {
  cd $startdir/src/sword-${pkgver}
  # assume sword built with lucene and icu
  #./configure --prefix=/usr --sysconfdir=/etc --with-lucene --with-icu
  cd bindings/swig/package
  sed -i 's/1\.5\.[78]/1\.5\.9/g' configure.ac
  libtoolize --force
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make pythonswig
  make python_make
  cd python
  python setup.py install --root=$startdir/pkg
}
