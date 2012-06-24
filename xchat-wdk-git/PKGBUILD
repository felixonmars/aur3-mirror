#Maintainer: TingPing tingping@tingping.se
pkgname=xchat-wdk-git
pkgver=1508.3
pkgrel=1
pkgdesc="A GTK+ based IRC client"
arch=('i686' 'x86_64')
url="http://www.xchat-wdk.org/"
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib' 'libnotify' 'libproxy')
makedepends=('git')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'tcl: for tcl plugin'
            'python2: for python plugin')
options=('!libtool')
provides=('xchat')
conflicts=('xchat')

build() {
  if [[ -d "$pkgname" ]]; then
    cd "$pkgname"
    git clean -dfx
    msg 'Cleaned files'
    git pull origin
    msg 'Updated files'
  else
    git clone 'https://code.google.com/p/xchat-wdk/' "$pkgname" --single-branch --branch wdk
    msg 'Cloned Repo'
  fi

  cd "$srcdir/$pkgname"
  chmod +x autogen.sh
  ./autogen.sh
  LIBS+="-lgmodule-2.0" ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share \
    --enable-openssl --enable-dbus --enable-nls --enable-ipv6 --enable-shm \
    --enable-spell=static
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
