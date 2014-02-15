# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=enity
pkgname=$_pkgname-git
pkgver=0.0.1.r3.58e7897
pkgrel=1
pkgdesc="A drop-in Zenity replacement written with the EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/devs/q66/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  ln -sf "../../licenses/$pkgname/AUTHORS" "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  ln -sf "../../licenses/$pkgname/COPYING" "$pkgdir/usr/share/doc/$_pkgname/COPYING"
}
