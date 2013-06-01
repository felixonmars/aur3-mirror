# Maintainer: anekos <anekos@snca.net>
_pkgname=growl-for-linux
pkgname=$_pkgname-git
pkgver=20130319
pkgrel=2
pkgdesc="Growl for Linux"
url="http://mattn.github.com/growl-for-linux/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('git' 'openssl' 'curl' 'gtk2' 'sqlite3' 'dbus-glib' 'desktop-file-utils')
optdepends=('libnotify')
makedepends=('git')
conflicts=('growl-for-linux')
options=('!libtool')
source=("$_pkgname::git+https://github.com/mattn/growl-for-linux.git")
md5sums=('SKIP')

build () {
  cd "$srcdir/$_pkgname"
  export LDFLAGS="$LDFLAGS -lgmodule-2.0"
  export LIBNOTIFY_LIBS="-lnotify"
  ./autogen.sh
  ./configure --prefix=/usr && make
}

package () {
  cd $srcdir/$_pkgname
  make install DESTDIR="$pkgdir" prefix=/usr
  install -Dm0644 "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
