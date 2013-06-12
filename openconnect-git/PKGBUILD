pkgname=openconnect-git
pkgver=20130611
pkgrel=1
pkgdesc="Open client for Cisco AnyConnect VPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.infradead.org/openconnect.html"
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc')
makedepends=('intltool' 'python2' 'git')
options=('!libtool' '!emptydirs')
provides=('openconnect')
conflicts=('openconnect')

_gitroot="git://git.infradead.org/users/dwmw2/openconnect.git"
_gitname="openconnect"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/openconnect"
	./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --sbindir=/usr/bin \
      --disable-static
  make
}

package() {
  cd "${srcdir}/openconnect"
  make DESTDIR="$pkgdir" install
}
