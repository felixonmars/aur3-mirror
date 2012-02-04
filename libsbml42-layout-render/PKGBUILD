# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=libsbml42-layout-render
_pkgname=libsbml
pkgver=4.2.0
pkgrel=1
pkgdesc="XML-based description language for computational models in systems biology with layout and render extensions"
url="http://sbml.org/Software/libSBML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxml2')
provides=('libsbml=4.2')
conflicts=('libsbml')
#optdepends=('bzip2' 'python2' 'perl' 'ruby' 'octave' 'java-runtime')
#builddepends=('swig')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/sbml/$_pkgname/$pkgver/$_pkgname-$pkgver-src.tar.gz"
        "http://otto.bioquant.uni-heidelberg.de/sbml/level2/20110115/libsbml-4.2.0-render-extension-20110115.patch.bz2")
md5sums=('734231025b9e75026206e806c187539b'
         '319a6fac4c28874211020386b37819b9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../libsbml-4.2.0-render-extension-20110115.patch

  autoconf
  ./configure --prefix=/usr --with-libxml --enable-layout --enable-render
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
