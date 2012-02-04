# Maintainer: Torbjorn Hoye <torbhoye at gmail dot com>

pkgname=rocrail-bzr
_pkgname=rocrail
pkgver=1566
pkgrel=1
pkgdesc="Rocrail - Model Railroad Control System"
arch=('i686' 'x86_64')
url="http://wiki.rocrail.net/"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('bzr' 'sed' 'make' 'wxgtk')
optdepends=('wxgtk: to run rocview')
conflicts=('rocrail')
source=(rc-rocrail)
md5sums=('f59bfc7e49e52b2586b674684dd811db')

_bzrtrunk=lp:rocrail
_bzrmod=rocrail

build() {
  cd ${srcdir}

  msg "Connecting to Bazaar server...."
  
  if [ -d ${_bzrmod}/.bzr ]; then
    cd ${_bzrmod} && bzr update
  else
    bzr branch ${_bzrtrunk}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  [ -d ${srcdir}/${_bzrmod}-build ] && rm -rf ${srcdir}/${_bzrmod}-build
  cp -r ${srcdir}/${_bzrmod} ${srcdir}/${_bzrmod}-build
  cd ${srcdir}/${_bzrmod}-build

  #
  # BUILD
  #

  make || return 1

  msg "Installing to pkgdir..."

  make DESTDIR="$pkgdir/opt/$_pkgname" install || return 1
  install -D -m755 ${srcdir}/rc-rocrail ${pkgdir}/etc/rc.d/rocrail || return 1
  install -D -m755 ${srcdir}/${_bzrmod}-build/rocrail/package/rocraild.sh ${pkgdir}/opt/rocrail/rocraild.sh || return 1
}
