# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=opencascade-docs
pkgver=6.6.0
pkgrel=1
pkgdesc="Documentation and examples for opencascade."
url="http://www.opencascade.org"
license="custom"
depends=()
makedepends=()
provides=()
conflicts=()
options=(!strip !upx)
replaces=()
arch=('i686' 'x86_64')
source=("http://files.opencascade.com/OCCT/OCC_${pkgver}_release/OpenCASCADE${pkgver//./}.tgz")
md5sums=('ad698d9b1e370c14999e7ec130575c92')

package() {
  # Installation dir
  local _installdir=/opt/opencascade

  # Copy files from source to the installation dir
  install -d -m 755 "${pkgdir}${_installdir}" || return 1
  cp -r "${srcdir}/ros/data" \
     	"${srcdir}/ros/samples" \
     	"${srcdir}/ros/doc" \
  	"${pkgdir}${_installdir}" || return 1
}

