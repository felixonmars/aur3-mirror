# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Michele Gastaldo <pikiweb@gmail.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=empower-svn
_pkgname=empower
pkgver=83648
pkgrel=1
pkgdesc="Polkit authentication agent for Enlightenment"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('elementary' 'e_dbus')
makedepends=('subversion')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/$_pkgname"
        'empower-e_dbus.patch')
md5sums=('SKIP'
         'f495e24afefb9608f9b768feca9e00b6')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

prepare() {
# Add E_DBus.h as it's not included with elementary.h from git
  cd "$srcdir/$_pkgname"
  patch -Np1 < "$srcdir/empower-e_dbus.patch"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
}
