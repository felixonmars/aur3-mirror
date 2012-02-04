# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Julien Noblet <julien.noblet@gmail.com>
pkgname=editje
pkgver=0.1.b
pkgrel=1
pkgdesc=""
arch=(any)
url="http://freebox-elixir.googlecode.com/"
license=('unknown')
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
source=(http://freebox-elixir.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('e0edf242613aedb62604ce9ae6a9a4d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
