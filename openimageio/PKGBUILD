# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=OpenImageIO
pkgname=openimageio
pkgver=0.10.4
pkgrel=1
pkgdesc="A library for reading and writing images, including classes, utilities, and applications."
arch=(i686 x86_64)
url="http://www.openimageio.org/"
license=('custom')
depends=('qt' 'openexr' 'boost-libs' 'jasper' 'glew' 'python2')
makedepends=('cmake' 'boost')
conflicts=("$pkgname-git")
source=("https://github.com/OpenImageIO/oiio/tarball/Release-${pkgver/_/-}")
md5sums=('08a1bc2b82862ad5547bba569f4f633f')

build() {
  cd "$srcdir"/$_pkg*

  # remove insecure rpath
  sed -i "/RPATH/d" src/CMakeLists.txt

  make
}

package() {
  cd "$srcdir"/$_pkg*/dist/*

  # prepare dirs
  install -d "$pkgdir"/usr/{share/doc/$_pkg,lib/python2.7/site-packages}

  # bin
  cp -a bin include lib "$pkgdir/usr"

  # docs
  cp -a doc/* "$pkgdir/usr/share/doc/$_pkg"

  # python module
  cp -a python/* "$pkgdir/usr/lib/python2.7/site-packages"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
