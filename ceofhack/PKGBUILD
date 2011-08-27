# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Nico Schottelius <nico-archlinux-pkg@schottelius.org>
pkgname=ceofhack
pkgver=0.6
pkgrel=1
pkgdesc="A decentralised, p2p, anonymous chat program and protocol"
arch=('i686' 'x86_64')
url="http://www.nico.schottelius.org/software/ceofhack/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('ceofhack')
conflicts=()
replaces=()
backup=()
options=()
install=
source=($url$pkgname-$pkgver.tar.xz)
noextract=()
md5sums=('a75af3edd8fb492485899a352e247c71')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  mkdir -p "$pkgdir/usr/bin"
  cp ceofhack "$pkgdir/usr/bin"
  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
