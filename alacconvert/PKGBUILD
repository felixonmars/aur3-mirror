# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=alacconvert
pkgver=3
pkgrel=1
pkgdesc="Apple Lossless Audio Codec encoder/decoder"
arch=('i686' 'x86_64')
url="http://alac.macosforge.org/"
license=('APACHE')
makedepends=('subversion')
source=('move-lflags.patch')
md5sums=('e98613b9b0e1aa0ec93fe3461e64fb2f')

_svnmod="alac"
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
  
  cd ${srcdir}/${_svnmod}-build/convert-utility
  
  # Patch from http://mtakagi.tumblr.com/post/12027648706/apple-lossless-audio-codec-freebsd
  patch -Np0 -i ${srcdir}/move-lflags.patch
  make
}

package() {
  cd ${srcdir}/${_svnmod}-build/convert-utility
  install -D alacconvert ${pkgdir}/usr/bin/alacconvert
  rm -rf $srcdir/$_svnmod-build
}
