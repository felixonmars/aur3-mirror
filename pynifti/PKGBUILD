# -*- shell-script -*-
#
# Contributor: Micah C. <micahc@vt.edu>

pkgname=pynifti
arch=('i686' 'x86_64')
pkgver=20100223
pkgrel=2
pkgdesc="python library for reading nifti files"
source=()
url="http://niftilib.sourceforge.net/pynifti/"
license="MIT"
depends=('nifticlib' 'python-numpy')
makedepends=('python' 'git' 'make')
md5sums=()

_gitroot="git://git.debian.org/git/pkg-exppsy/pynifti.git"
_gitname="pynifti"

build() {
  cd ${srcdir}
  msg "Connecting to $pkgname GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
          cd $_gitname && git pull origin
          msg "The local files are updated."
  else
          git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  msg "Building..."
  python setup.py build
  msg "Installing..."
  /usr/bin/env python setup.py install --prefix=${pkgdir}/usr
}
