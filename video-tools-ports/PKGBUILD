# Contributor: Otakar Haška <ota.haska@seznam.cz>
pkgname=video-tools-ports
pkgver=1
pkgrel=1
_pkgname1=bbtools
_pkgname2=pulldown
_pkgname3=vstrip
_pkgver1=1.9
_pkgver2=0.99d
_pkgver3=0.8e
pkgdesc="Ports of video tools bbinfo, bbainfo, bbvinfo, bbdemux, pulldown and vstrip"
arch=('i686' 'x86_64')
url="http://vidtoolports.sourceforge.net/"
license=('GPL')
depends=()
source=(http://downloads.sourceforge.net/vidtoolports/$_pkgname1-$_pkgver1.tar.bz2 http://downloads.sourceforge.net/vidtoolports/$_pkgname2-$_pkgver2.tar.bz2 http://downloads.sourceforge.net/vidtoolports/$_pkgname3-$_pkgver3.tar.bz2 patch-vstrip.diff)
md5sums=('7268bfc2edb103b8e0240c8d5eeaf0fe' '1e3dd9e5a5154377917e5059c914af28' '5207889c0975b965839e80a0453fbc9a' '812f5dfc4f4a120307b82cab593618af')
build() {
  cd "${srcdir}/${_pkgname1}-${_pkgver1}"
  make || return 1 
  install -d ${pkgdir}/usr/bin
  install -o root -g root -m 755 -s  bbainfo ${pkgdir}/usr/bin/
  install -o root -g root -m 755 -s bbvinfo ${pkgdir}/usr/bin/
  install -o root -g root -m 755 -s bbinfo ${pkgdir}/usr/bin/
  install -o root -g root -m 755 -s bbdmux ${pkgdir}/usr/bin/

  cd "${srcdir}/${_pkgname2}-${_pkgver2}"
  make || return 1 
  install -o root -g root -m 755 -s  pulldown ${pkgdir}/usr/bin/

  cd "${srcdir}/${_pkgname3}-${_pkgver3}"
  patch -p0 < ../patch-vstrip.diff || return 1
  make || return 1 
  install -o root -g root -m 755 -s vstrip ${pkgdir}/usr/bin/
}
