# Maintainer: gravgun <gravgun at openmailbox dot org>
_pkgname=luawrapper
pkgname=${_pkgname}-hg
pkgver=20140518
pkgrel=1
pkgdesc='Library designed to help bridge the gab between Lua and C++'
arch=('any')
url='https://bitbucket.org/alexames/luawrapper/overview'
license=('MIT')
makedepends=('mercurial')
provides=('luawrapper')
conflicts=('luawrapper')
source=("hg+https://bitbucket.org/alexames/luawrapper")
sha256sums=('SKIP')

package() {
  cd luawrapper
  install -Dm0644 luawrapper.hpp "${pkgdir}/usr/include/luawrapper.hpp"
  install -Dm0644 luawrapperutil.hpp "${pkgdir}/usr/include/luawrapperutil.hpp"
  mkdir -p "${pkgdir}/usr/lib/pkgconfig"
  cat <<EOF > "${pkgdir}/usr/lib/pkgconfig/${_pkgname}.pc"
Name: ${_pkgname}
Description: ${pkgdesc}
Version: ${pkgver}
EOF
}