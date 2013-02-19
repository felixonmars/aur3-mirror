# Maintainer: kfgz <kfgz at interia pl>

pkgname=libimago-svn
pkgver=53
pkgrel=1
pkgdesc="Image file format I/O library"
url="http://gfxtools.sourceforge.net/"
license=('custom')
arch=(i686 x86_64)
provides=('libimago')
conflicts=('libimago')

_svntrunk="http://gfxtools.svn.sourceforge.net/svnroot/gfxtools/libimago"
_svnmod="libimago"

build() {
  if [ -d ${_svnmod}/.svn ]; then
     (cd ${_svnmod} && svn up -r ${pkgver})
   else
     svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}"/libimago
  sed -i "s/O3/O2/g" configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/libimago
  install -dm755 "${pkgdir}"/usr/{lib,lib/pkgconfig,include,share/doc/libimago,share/licenses/libimago}
  install -m644 libimago.a "${pkgdir}"/usr/lib
  install -m755 libimago.so "${pkgdir}"/usr/lib
  install -m644 imago.pc "${pkgdir}"/usr/lib/pkgconfig
  install -m644 README "${pkgdir}"/usr/share/doc/libimago
  install -m644 src/image.h "${pkgdir}"/usr/include/imago.h
  install -m644 COPYING "${pkgdir}"/usr/share/licenses/libimago
}
