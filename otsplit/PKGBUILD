#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=otsplit
pkgver=2013.2.27.2
pkgrel=1
pkgdesc='Split and join files via cryptologically secure one-time pads.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/otsplit"
source=(
  http://xyne.archlinux.ca/projects/otsplit/src/otsplit-2013.2.27.2.tar.xz
  http://xyne.archlinux.ca/projects/otsplit/src/otsplit-2013.2.27.2.tar.xz.sig
)
sha512sums=(
  0c8892f56a6179ddcb390356f7bcad0c99c965e4728c86e4bc493b5c9ec0ed42e9c880da13fdd8780dab51828c6d4a9012d196f2fb85fdcfa7f152719c31bb6d
  5efe2bd3e34c04d617fec1be3f23a5a27ef4cb2822328fd55e881c5dcc3738fb04d3bc72034666c6e82234128280c849540d4352d6198ea75324c3e0bfa72b4d
)
md5sums=(
  cd98b4d5b16e9dcd36ac44f55beabd2c
  4b7514837bffd64a4a1b2ba65ee9355a
)

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make
}

package ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
