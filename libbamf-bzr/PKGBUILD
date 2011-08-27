# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=libbamf-bzr
pkgbranch=0.2
pkgver=405
pkgrel=1
pkgdesc="Removes the headache of applications matching into a simple DBus daemon and c wrapper library. Currently features application matching at amazing levels of accuracy (covering nearly every corner case)."
arch=('i686' 'x86_64')
url="https://launchpad.net/bamf"
license=('GPL')
depends=('indicator-application-bzr' 'gtk2-ubuntu' 'libgtop' 'libwnck')
makedepends=('bzr')
provides=('libbamf')
conflicts=('libbamf')
source=()
md5sums=()

_bzrbranch=lp:bamf
_bzrmod=bamf

build() {
   cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  ./autogen.sh || return 1
  ./configure --disable-static --prefix=/usr || return 1
  find . -name Makefile -exec sed -i 's/-Wall -Werror//g' {} \;
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
