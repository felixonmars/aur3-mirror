# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=speckeysd
pkgver=20061012
pkgrel=2
pkgdesc="Special Keys Daemon"
arch=('i686' 'x86_64')
url="http://www.jessies.org/~enh/software/x11/"
license=('GPLv2' 'GPLv3')
makedepends=('imake')
source=("http://www.jessies.org/~enh/software/x11/$pkgname.tar.gz")
sha512sums=('3fe44d8e4af4347b50a34d1d93c50d980eaae993459990098b8054be1c3d4ddeb5f4101217ff1d336c40967b21053ec06da5174c562d8bf862c51977a2ec1bc5')

package() {
  cd "$srcdir/$pkgname"
  xmkmf
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
