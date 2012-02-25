# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=libpicviz
pkgver=0.6
pkgrel=1
pkgdesc="A parallel coordinates plotter which enables easy scripting from various input (Python 2 library)"
arch=('i686' 'x86_64')
url="http://www.picviz.com/sections/opensource/picviz.html"
license=('GPL')
depends=('cairo' 'python2')
makedepends=('libevent' 'pcre' 'cmake')
source=("http://www.picviz.com/sections/opensource/picviz-latest.tar.bz2")
sha256sums=('3fdc4f60c821f377514ccd5ceacf83b197e747ea928e6f80e020c25395a43b00')

build() {
  cd "$srcdir/picviz-latest/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/picviz-latest/$pkgname"

  make DESTDIR="$pkgdir/" install

  cd src/bindings/python
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
