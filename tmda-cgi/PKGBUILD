# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=tmda-cgi
pkgver=0.16.4
pkgrel=3
pkgdesc="CGI script for managing TMDA account"
arch=(any)
url="http://tmda.net"
license=('GPL')
groups=()
depends=('tmda=1.1.12' 'checkpassword-pam' 'python2')
makedepends=('patch' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://tmda.sourceforge.net/tmda-cgi/releases/$pkgname-$pkgver.tar.bz2 fix-import.patch python2.patch)
noextract=()
md5sums=('988a67040e4b44327bf6bcb93aceec6e' 'c48b914b35cdc2b9e24064126dac860c' 'dc2a08439900dce44ac2b679bd053677')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../../fix-import.patch

  patch -p1 < ../../python2.patch

  ./configure --base-dir /usr/share/tmda --display-dir /$pkgname --install-prefix /usr/share/$pkgname --mode system-wide --remote-auth imaps --virtual-lookup None || return 1

  make || return 1
  
  mkdir -p "$pkgdir/usr/share" || return 1

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname" || return 1

  mkdir -p "$pkgdir/srv/http/cgi-bin" || return 1
  cp -a tmda.cgi "$pkgdir/srv/http/cgi-bin" || return 1
  ln -s "/usr/share/$pkgname/display" "$pkgdir/srv/http/$pkgname" || return 1
}

# vim:set ts=2 sw=2 et:
