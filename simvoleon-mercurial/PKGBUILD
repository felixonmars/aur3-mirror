# Maintainer: Dominik Fuchs <dominik.fuchs@wur.nl>

pkgname=simvoleon-mercurial
pkgver=994
pkgrel=1
pkgdesc="3D graphics development system, in the form of an add-on library to Coin3D"
url="http://www.coin3d.org/lib/simvoleon"
license="GPL"
arch=('i686' 'x86_64')
depends=('coin' 'soqt')
makedepends=('mercurial')
provides=('simvoleon')
conflict=('simvoleon')
source=()
md5sums=()
_hgroot=http://hg.sim.no/SIMVoleon/
_hgrepo=default

build() {
  cd ${startdir}/src

  if [ -d ${_hgrepo} ]; then
      cd ${startdir}/src/${_hgrepo}
      hg pull -u
  else
      hg clone ${_hgroot}${_hgrepo} || return 1
      cd ${startdir}/src/${_hgrepo}
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."
  
  cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
  cd ${startdir}/src/${_hgrepo}-build

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -rf ${startdir}/src/${_hgrepo}-build
}
