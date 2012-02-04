# 

pkgname=pdnsd-git
pkgver=20111031
pkgrel=1
pkgdesc="Is a proxy DNS server with permanent caching"
url="http://www.phys.uu.nl/~rombouts/pdnsd/"
arch=('i686' 'x86_64')
license=('GPL3' 'custom:BSD')
depends=('glibc')
makedepends=('git')
conflicts=('pdnsd')
provides=('pdnsd')
backup=('etc/pdnsd.conf')
source=('pdnsdrc')
sha1sums=('515b03638593e25adab7401351aa80eb1e061fcb')
sha256sums=('40049321f79403b1358b854da3d36e408077243af09f2ca7a1e25e847ad11fd4')

_gitroot="git://gitorious.org/pdnsd/pdnsd.git"
_gitname="pdnsd"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  export CFLAGS="${CFLAGS} -fPIE"
  export LDFLAGS="-pie ${LDFLAGS} -Wl,-z,now"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.BSD "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.BSD"
  install -D -m555 "$srcdir/pdnsdrc" "${pkgdir}/etc/rc.d/pdnsd"
}

# vim: ft=sh syn=sh et
