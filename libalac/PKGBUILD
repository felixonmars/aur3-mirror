# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=libalac
pkgver=3
pkgrel=1
pkgdesc="Apple Lossless Audio Codec Library"
arch=('i686' 'x86_64')
url="http://alac.macosforge.org/"
license=('APACHE')
makedepends=('subversion')

_svnmod="libalac"
_svntrunk="http://svn.macosforge.org/repository/alac/trunk"

build() {
  cd ${srcdir}
  msg "Connecting to the SVN repository..."
 
  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"

  if [[ -d ${srcdir}/${_svnmod}-build ]]; then
     rm -rf ${srcdir}/${_svnmod}-build
  fi
  
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build/codec
 
  make
}

package() {
  cd ${srcdir}/${_svnmod}-build/codec
  install -D libalac.a ${pkgdir}/usr/lib/libalac.a
  rm -rf $srcdir/$_svnmod-build
}
