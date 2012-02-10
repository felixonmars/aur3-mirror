# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=treeviewx
_shortpkgname=tv
pkgver=0.5
pkgrel=1
pkgdesc="Program to display phylogenetic trees on Linux, Unix, Mac OS X, and Windows platforms."
arch=('i686' 'x86_64')
url="http://code.google.com/p/treeviewx/"
license=('GPL')
depends=('wxgtk')
source=(http://treeviewx.googlecode.com/files/${_shortpkgname}-${pkgver}.tar.gz)
#Some of the flags seem to cause issues with treeview...
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS

build() {
  cd ${srcdir}/${_shortpkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
}

md5sums=('8059a306b723e6fb4d3befcf302b2920')
