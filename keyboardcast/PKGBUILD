# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=keyboardcast
pkgver=0.1.1
pkgrel=5
pkgdesc='An app to relay text to selected windows'
arch=('i686' 'x86_64')
url='http://desrt.mcmaster.ca/code/keyboardcast'
license=('GPL')
depends=('libwnck' 'libglade' 'libxmu' 'desktop-file-utils')
install=$pkgname.install
#source=("http://desrt.mcmaster.ca/code/$pkgname/$pkgname-$pkgver.tar.gz") # Unreachable
source=("http://archive.ubuntu.com/ubuntu/pool/universe/k/keyboardcast/keyboardcast_$pkgver.orig.tar.gz")
md5sums=('5ed46188c70f5622a64d90965db389dc')

build() {
  cd $pkgname-$pkgver
  LDFLAGS="-lX11" make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
