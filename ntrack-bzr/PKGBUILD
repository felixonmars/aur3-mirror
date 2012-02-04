# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ntrack-bzr
pkgver=312
pkgrel=1
pkgdesc="A network connectivity tracking library"
arch=('i686' 'x86_64')
url="https://launchpad.net/ntrack"
license=('LGPL')
depends=('qt' 'libnl' 'gcc-libs')
makedepends=('python2' 'bzr')
provides=('ntrack')
conflicts=('ntrack')
options=('!emptydirs' '!libtool')

_bzrtrunk="lp:ntrack"
_bzrmod="ntrack"

build() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  cd "${_bzrmod}-build"

  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${_bzrmod}-build"
  make DESTDIR="${pkgdir}" install
}

