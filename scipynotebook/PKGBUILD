# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=SciPyNotebook
pkgname=scipynotebook
pkgver=0.2.1
pkgrel=1
pkgdesc="A notebook-style editor to hack Python with the comfort of an editor and the interactivity of a console."
arch=(i686 x86_64)
url="https://github.com/hmatuschek/SciPyNotebook/wiki"
license=('GPL')
depends=('python2-scipy' 'python2-matplotlib')
install="$pkgname.install"
source=("https://github.com/hmatuschek/SciPyNotebook/tarball/v$pkgver"
        "$pkgname.desktop")
md5sums=('265ac9f1c7ddac513ad46916c385a0a4'
         '222d3ec7b6651323b98e0af62a5fa169')

build() {
  cd `find $srcdir -mindepth 1 -maxdepth 1 -type d`

  # fix file place
  cp rsrc/icon.png doc/logo.png
  cp rsrc/$_pkg.desktop .

  [ -d build ] || mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd `find $srcdir -mindepth 1 -maxdepth 1 -type d`/build

  make DESTDIR="$pkgdir/" install

  # desktop and pixmaps
  install -Dm644 "$srcdir/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../doc/logo.svg \
                 "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  rm "$pkgdir/usr/share/applications/$_pkg.desktop"
}

# vim:set ts=2 sw=2 et:
