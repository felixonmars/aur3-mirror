# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=vectoroids
pkgver=1.1.0
pkgrel=3
pkgdesc='Clone of the classic arcade game "Asteroids" by Atari'
depends=('sdl_mixer' 'sdl_image')
source=("ftp://ftp.tuxpaint.org/unix/x/$pkgname/src/$pkgname-$pkgver.tar.gz")
license=('GPL2')
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/vectoroids/"
sha256sums=('8d14dd281767e994108abd77c8e67d5a17718d0ad1e34d37e026911d14697b2e')

build() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DATA_PREFIX=/usr/share/vectoroids/
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}
