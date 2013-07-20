#Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=etrophy-git
_pkgname=${pkgname%-*}
pkgver=0.5.1.33.8df5be2
pkgrel=2
pkgdesc="EFL based library that manages scores, trophies and unlockables - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!libtool')
source=("git://git.enlightenment.org/games/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
