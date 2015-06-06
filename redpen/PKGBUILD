pkgname=redpen
_pkgver=1.2
pkgver=${_pkgver}.0
pkgrel=1
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime')
source=(https://github.com/recruit-tech/redpen/releases/download/v${pkgver}/redpen-${pkgver}.tar.gz)
sha256sums=('4456fb1917ba33be71b8a41b41a43f36ec801c64d7bb0f2bb10a4685cf38d8e6')

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-cli-${_pkgver}" "${srcdir}/${pkgname}"
  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/redpen"
#!/bin/sh
exec /opt/${pkgname}/bin/redpen \$@
EOF
  chmod a+x "${pkgdir}/usr/bin/redpen" 
}
