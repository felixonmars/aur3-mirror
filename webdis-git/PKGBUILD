# Maintainer: <predrg@gmail.com>

pkgname=webdis-git
pkgver=20131126
pkgrel=3
pkgdesc="A Redis HTTP interface with JSON output."
arch=('i686' 'x86_64')
url="http://webd.is/"
license=('BSD')
groups=('network')
depends=('redis' 'libevent')
makedepends=('git' 'make' 'gcc')
provides=(webdis)
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=(webdis.logrotate webdis.service)
md5sums=('9ae1e2893f3666ddbb17ac2c93b3ddd0'
         '51dcf95f292cdc2ef3e014dd93460ab8')

_gitroot="git://github.com/nicolasff/webdis.git"
_gitname="webdis"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  CFLAGS="$CFLAGS $(egrep '^CFLAGS' "$srcdir/$_gitname-build/Makefile" | cut -d' ' -f3-)" \
  LDFLAGS="$LDFLAGS $(egrep '^LDFLAGS' "$srcdir/$_gitname-build/Makefile" | cut -d' ' -f3-)" \
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  #mv "$DESTDIR/etc/webdis.prod.json" "$DESTDIR/etc/webdis.json"

  install -D -m755 "$srcdir/$_gitname-build/COPYING" "$pkgdir/usr/share/licenses/webdis/COPYING"
  install -Dm644 "$srcdir/webdis.service" "$pkgdir/usr/lib/systemd/system/webdis.service"
  install -Dm644 "$srcdir/webdis.logrotate" "$pkgdir/etc/logrotate.d/webdis"
} 
