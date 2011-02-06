# Contributor: Nick Østergaard <oe.nick@gmail.com>

pkgname=fped-svn
pkgver=5941
pkgrel=1
pkgdesc="Footprint Editor for KiCad used by Openmoko developers"
arch=('i686' 'x86_64')
url='http://svn.openmoko.org/trunk/eda/fped'
license=('GPLv2')
depends=('imagemagick' 'ttf-liberation' 'netpbm' 'gtk2' 'flex' 'transfig')
makedepends=('subversion')
provides=('fped')
conflicts=('fped')
replaces=('fped')
source=()
md5sums=()

_svnmod="fped"
_svntrunk="http://svn.openmoko.org/trunk/eda/fped"

build() {
  cd ${srcdir}

  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r $pkgver)
  else
    svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  mkdir -p $pkgdir/usr/bin

  make dep || return 1
  make all || return 1
  make PREFIX=$pkgdir/usr install || return 1

#  rm -rf ${srcdir}/${_svnmod}-build
}

