#Autor: Pablo Novara - Zaskar
#Maintainer: mncarbone

pkgname=zinjai
pkgver=20140322
pkgrel=1
pkgdesc='Lightweight and easy to use cross-platform C++ IDE'
options=()
arch=('i686' 'x86_64')
url="http://zinjai.sourceforge.net/"
license=('GPL2')
#depends=('libpng12')
optdepends=()
makedepends=()
download_url='http://ufpr.dl.sourceforge.net/project'
if [ "${CARCH}" = 'x86_64' ]; then
  source=("${download_url}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-l64-${pkgver}.tgz")
elif [ "${CARCH}" = 'i686' ]; then
  source=("${download_url}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-l32-${pkgver}.tgz")
fi

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications/"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "[Desktop Entry]" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Type=Application" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Name=ZinjaI" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Comment=${pkgdesc}" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Comment[es]=Un liviano y fácil de usar IDE multiplataforma para C++" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Exec=/opt/${pkgname}/${pkgname}" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Icon=/opt/${pkgname}/imgs/${pkgname}-256x256.png" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Terminal=false" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Categories=Development;IDE;" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/bin/"
  touch "${pkgdir}/usr/bin/${pkgname}"
  echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "/opt/${pkgname}/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}


md5sums=('c449cece16da524d8bcacf213f6c1f02')
[ "$CARCH" = "x86_64" ] && md5sums[0]='dbdcaaa9ee365bc6f8455a64c3b17582'