# Maintainer: Kosta Welke <kosta@fillibach.de>
# I wrote this PKGBUILD as it's needed by forked-daapd, I could not find the 
# original url (domain seems abandoned). But it's mirrored by forked-daapd,
# so I put that as the url.
pkgname=libavl-for-forked-daapd
pkgver=0.3.5
pkgrel=1
pkgdesc="AVLTree is a small implementation of AVL trees."
arch=('i686' 'x86_64')
url="http://ftp.debian.org/debian/pool/main/liba/libavl"
license=('LGPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ftp.debian.org/debian/pool/main/liba/libavl/libavl_$pkgver.orig.tar.gz)
noextract=()
md5sums=('882c68ea7f71876ca110f3b84d7ab12d')
sha1sums=('6e0226160980ec3e9a023e582026560f7e88d200')
sha256sums=('4497b9e22cdd61ae2fa893b9d5fd6213dc306726d7c4be08c29e173622dca8a0')
sha384sums=('e1be8ae8a060e9d90a3fa35d5d0be2fb89bde1fff663caaa00e705a9fe7783560e112fdf297e63a326813920ef147f46')
sha512sums=('6a409025eb4560961c35bf0d80deb592ada9b448c497955ec7662a478fc4cebfdd46b9f33db0c913af773614752444563d29cea4418f896eb2761a233ee64b6d')

build() {
  cd "$srcdir/avl-$pkgver"

#  ./configure --prefix=/usr
  make clean
  make CFLAGS="$CFLAGS -fPIC"
}

package() {
  cd "$srcdir/avl-$pkgver"

  mkdir -p $pkgdir/usr/include
  prefix=/usr includedir=/usr/include/ LIBRARIES=libavl.so.1.5 make DESTDIR="$pkgdir/" install
}
