# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: fancris3 <fancris3 at aol.com>
# Contributor: fbianconi <fbianconi at gmail.com>

_pkgname=engage
pkgname=$_pkgname-git
pkgver=1.0.0.r104.40d3701
pkgrel=1
pkgdesc="Enlightenment module: A taskbar and app-launcher dock, which makes use of composite."
arch=('i686' 'x86_64')
url="http://git.enlightenment.org/enlightenment/modules/engage.git"
license=('MIT')
depends=('enlightenment<0.17.99')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
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

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING COPYING-PLAIN
}
