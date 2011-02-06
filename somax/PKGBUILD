# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Paulo Freire <paulofreire gmail com>
pkgname=somax
pkgver=20071018
pkgrel=1
pkgdesc="GUI for soma"
arch=(i686)
url="http://www.somasuite.org/"
license=('GPL')
groups=()
depends=('vte' 'openssl' 'soma')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(http://www.somasuite.org/src/snapshots/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('6197969fd0ca33eab9e30585aa68b0bb') #generate with 'makepkg -g'

build() {
  cd $startdir/src/$pkgname-1.4.dev
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-gtksourceview
  make || return 1
  make DESTDIR=$startdir/pkg install

}

# vim:set ts=2 sw=2 et: