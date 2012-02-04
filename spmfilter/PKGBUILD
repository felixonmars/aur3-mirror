# Maintainer: Axel Steiner <ast@treibsand.com>
pkgname=spmfilter
pkgver=0.4.2
pkgrel=1
pkgdesc="spmfilter is a high-performance mail filtering framework, written in C."
arch=('i686' 'x86_64')
url="http://www.spmfilter.org"
license=('LGPL')
groups=('network')
depends=('libesmtp' 'gmime>=2.4' 'libldap>=2.2' 'libzdb>=2.4')
makedepends=('cmake>=2.6' 'glib2>=2.11' 'pkg-config' 'libesmtp' 'gmime>=2.4' 'libldap>=2.2' 'libzdb>=2.4')
optdepends=()
provides=('spmfilter')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.spmfilter.org/attachments/download/60/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(c4e0b2a71a39fe66fe6e5e62250117e5) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DPREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
