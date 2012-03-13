# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=ogitor-unstable-hg
pkgver=160
pkgrel=1
pkgdesc="Scene editing framework for Ogre3D"
arch=('i686' 'x86_64')
url='http://www.ogitor.org'
license=('LGPL')
depends=('ogre' 'qt')
makedepends=('cmake' 'mercurial' 'unzip')
conflicts=('ogitor')
provides=('ogitor')
source=(http://www.ogitor.org/media.zip
        http://www.ogitor.org/projects.zip)
md5sums=('7aea54303184b0b239d6ccee26e15429'
         '1274670ccd7ee47994898471e47de0c9')

_hgtrunk="http://hg.ogitor.org/development"
_hgmod="ogitor"

build() {
  cd ${srcdir}

  if [ -d $_hgmod/.hg ]; then
    cd $_hgmod && hg pull -u
  else
    hg clone $_hgtrunk $_hgmod
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  if [ -d $_hgmod-build ]; then
	  rm -rf $_hgmod-build
  fi
  hg clone $_hgmod $_hgmod-build
  cd $_hgmod-build

  cd ${srcdir}/$_hgmod-build

  unzip -d RunPath ${srcdir}/media.zip
  unzip -d RunPath ${srcdir}/projects.zip

  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=${pkgdir} install
}
