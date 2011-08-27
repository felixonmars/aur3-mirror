# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jackctlmmc
pkgver=4
pkgrel=1
pkgdesc="A small application that allows the user to control JACK transport via Midi Machine Control (MMC) commands."
arch=(i686 x86_64)
url="http://jackctlmmc.sourceforge.net/"
license=('GPL')
depends=('lash' 'util-linux' 'qt')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/version%20$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('512164d46b8ef2db2dc47dc5e4f7775a')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
