#Autor: Pablo Novara - Zaskar
#Maintainer: mncarbone

pkgname=pseint
pkgver=20150505
pkgrel=1
pkgdesc='A tool for learning programming basis with a simple spanish pseudocode'
options=()
arch=('i686' 'x86_64')
url="http://pseint.sourceforge.net/"
license=('GPL2')
depends=('libpng12')
optdepends=()
makedepends=()
download_url='http://ufpr.dl.sourceforge.net/project'
if [ "${CARCH}" = 'x86_64' ]; then
  source=("${download_url}/${pkgname}/${pkgver}/${pkgname}-l64-${pkgver}.tgz")
elif [ "${CARCH}" = 'i686' ]; then
  source=("${download_url}/${pkgname}/${pkgver}/${pkgname}-l32-${pkgver}.tgz")
fi

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications/"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "[Desktop Entry]" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Type=Application" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Name=PSeint" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Comment=A tool for learning programming basis with a simple spanish pseudocode" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Comment[es]=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Exec=/opt/${pkgname}/wxPSeint" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Icon=/opt/${pkgname}/imgs/icon.svg" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Terminal=false" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  echo "Categories=Development;IDE;" >> "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/bin/"
  touch "${pkgdir}/usr/bin/${pkgname}"
  echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "/opt/${pkgname}/wxPSeInt" >> "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}


md5sums=('dd5a70d9ea6eee43617f8602d623a8e6')
[ "$CARCH" = "x86_64" ] && md5sums[0]='b2fa74417f43507e323ae039c2fe323e'