# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gst-v4l2loopback
pkgver=0.2.0
pkgrel=2
pkgdesc="A gstreamer element that allows to write to a v4l2-loopback."
arch=(i686 x86_64)
url="https://github.com/umlaeute/gst-v4l2loopback/"
license=('GPL')
depends=('v4l2loopback' 'gstreamer0.10-base')
makedepends=('libtool')
source=("${url}tarball/v0.2.0")
md5sums=('a774a736718ca36f3d1e9f1cde9c269d')

build() {
  cd "$srcdir"/umlaeute*

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir"/umlaeute*

  # module
  install -Dm755 .libs/lib${pkgname/*-}.so \
    "$pkgdir/usr/lib/gstreamer-0.10/lib${pkgname/*-}.so"

  # doc
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
