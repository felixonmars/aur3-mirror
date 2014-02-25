# Maintainer: Ricky Sheaves <ricky[at]westdowneast[dot]com>
pkgbase=mudita24
pkgname=mudita24-svn
pkgver=15
pkgrel=1
pkgdesc="Improved Control Panel for Ice1712 Audio Cards"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mudita24/"
license=('GPLv2')
depends=('alsa-lib' 'gtk2>=2.2')
makedepends=('cmake' 'subversion')
source=(mudita24.desktop mudita24.png)
md5sums=('71d692e6edea031aa791c92862e5d95d'
         '3f039ae5900c449d1887e34ce1ebfc62')

_svntrunk=http://mudita24.googlecode.com/svn/trunk/
_svnmod=mudita24-read-only

build() {
  cd ${srcdir}
  msg "Connecting to SVN server ..."

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout."
  msg "Starting make ..."
  
  cd "${_svnmod}/${pkgbase}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${_svnmod}/${pkgbase}"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/mudita24.desktop" "${pkgdir}/usr/share/applications/mudita24.desktop"
  install -D -m644 "${srcdir}/mudita24.png"     "${pkgdir}/usr/share/pixmaps/mudita24.png"
  
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgbase/COPYING"
}