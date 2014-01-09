# Maintainer: Vladimir Navrat <vn158 at seznam dot cz>

_svnmod=chdkptp
pkgname=$_svnmod-svn
pkgver=477
pkgrel=3
pkgdesc="Client created specifically for controlling CHDK Canon cameras"
arch=('i686' 'x86_64')
url="http://chdk.wikia.com/"
license=('GPL')
depends=('libusb' 'iup-all-bin')
makedepends=('subversion')
provides=($_svnmod)
conflicts=($_svnmod)
source=($_svnmod::svn+http://subversion.assembla.com/svn/chdkptp/trunk chdkptp.desktop chdkptp.sh)
md5sums=('SKIP' 'a55c9486e22456c66ce7813e2fde36ab' '18edbe44700c1e9751e23a13cb6b0230')

pkgver() {
  cd "${SRCDEST}"/$_svnmod
  svnversion | tr -d [A-z]
}

build() {
  cd $_svnmod
  cp config-sample-linux.mk config.mk
  echo IUP_SUPPORT=1 >> config.mk
  echo CD_SUPPORT=1 >> config.mk
  echo DEBUG=0 >> config.mk
  echo IUP_INCLUDE_DIR=/usr/include/iup-3.7 >> config.mk
  echo CD_INCLUDE_DIR=/usr/include/cd-5.6 >> config.mk
  make
}

package() {
  cd $_svnmod
  install -d -m 0755 "${pkgdir}"/usr/bin
  install -m 0755 ../${_svnmod}.sh "${pkgdir}"/usr/bin/${_svnmod}

  install -d -m 0755 "${pkgdir}"/usr/share/applications
  install -m 0644 ../${_svnmod}.desktop "${pkgdir}"/usr/share/applications

  install -d -m 0755 "${pkgdir}"/usr/share/"${pkgname}/lua/extras"

  install -D -m 0755 chdkptp "${pkgdir}"/usr/share/"${pkgname}"
  install -D -m 0755 chdkptp-sample.sh "${pkgdir}"/usr/share/"${pkgname}"

  install -D -m 0644 *.TXT "${pkgdir}"/usr/share/${pkgname}
  install -D -m 0644 COPYING "${pkgdir}"/usr/share/${pkgname}

  install -D -m 0644 lua/*.lua "${pkgdir}"/usr/share/${pkgname}/lua
  install -D -m 0644 lua/extras/*.lua "${pkgdir}"/usr/share/${pkgname}/lua/extras
}
