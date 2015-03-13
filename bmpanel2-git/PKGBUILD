# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: nsf <no.smile.face@gmail.com>

_pkgname=bmpanel2
pkgname=bmpanel2-git
pkgver=2.1pre1.r106.g5ad46c8
pkgrel=1
pkgdesc="The second major release of the known panel."
arch=("i686" "x86_64")
url="http://code.google.com/p/bmpanel2"
license=('MIT')
depends=('libxext' 'pango' 'libxinerama')
optdepends=('pygtk: bmpanel2cfg utility')
makedepends=('git' 'cmake' 'asciidoc' 'python2')
provides=('bmpanel2')
conflicts=('bmpanel2')
source=("git://github.com/nsf/bmpanel2.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DPYTHON_EXECUTABLE=/usr/bin/python2.7 .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
