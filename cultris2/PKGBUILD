# Maintainer: Ole Bergmann <ole@ole.im>
pkgname=cultris2
pkgver=1.3c
pkgrel=1
pkgdesc="Cultris II is one of the fastest Tetris®-clones ever!"
arch=(i686 x86_64)
url="http://gewaltig.net/cultris2.aspx"
license=('GPL')
depends=(wine unzip)
provides=(cultris2)
install=cultris2.install
_zipfile="$pkgname-$pkgver.app.zip"
source=(http://www.jubla-doettingen.ch/cultris/$_zipfile
  windows.jar
  cultris2.sh
  cultris2.install
)

noextract=($_zipfile)
md5sums=('bd703c44664ca57412ebaed4cdf442dc'
         'eb87b381da79f6e4652af187a85bc83e'
         'fc3fd82353a293342cf35ddb47e69652'
         'bd99133f7d52a0df495373cdf921734c')

package() {
  install -dm644 "${pkgdir}/opt/${pkgname}"

  unzip -j "${srcdir}/${_zipfile}" "Cultris.app/Contents/Resources/Java/*" -d "${pkgdir}/opt/${pkgname}"
  unzip "${srcdir}/windows.jar" "*.dll" -d "${pkgdir}/opt/${pkgname}"

  chgrp -R wheel "${pkgdir}/opt/${pkgname}"
  chmod -R 777 "${pkgdir}/opt/${pkgname}"

  install -Dm755 cultris2.sh "${pkgdir}/opt/${pkgname}/cultris2.sh"

  install -d "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
