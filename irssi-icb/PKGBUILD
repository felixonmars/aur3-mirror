# vim: ts=2:sw=2:et

pkgname='irssi-icb'
pkgver=r17.g46f6976
pkgrel=1
_irssiver=0.8.15
pkgdesc="ICB (Internet Citizen's Band) plugin for Irssi"
arch=('x86_64')
url="https://github.com/jperkin/irssi-icb"
license=('GPL2')
source=("http://irssi.org/files/irssi-$_irssiver.tar.bz2"
        "git+https://github.com/jperkin/irssi-icb.git")
md5sums=('1dcb3f511b88df94b0c996f36668c7da'
         'SKIP')

pkgver() {
  cd "$srcdir/irssi-icb"
  r=$(git rev-list --count HEAD)
  g=$(git rev-parse --short HEAD)
  echo r$r.g$g
}

prepare() {
  cd "$srcdir/irssi-icb"
  sed -i 's/ -Werror / /' configure.ac
}

build() {
  cd "$srcdir/irssi-$_irssiver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-ipv6 \
    --with-perl=no ;
  make

  cd "$srcdir/irssi-icb"
  ./autorun.sh
  ./configure \
    --prefix=/usr \
    --with-irssi="$srcdir/irssi-$_irssiver" ;
  make
}

package() {
  cd "$srcdir/irssi-icb"
  make DESTDIR="$pkgdir" install
}
