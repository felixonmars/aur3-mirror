# Original Author: clowwindy
# Maintainer: JokerYu <dayushinn@gmail.com>

pkgname=shadowsocks-gui
pkgver=0.4
pkgrel=2
pkgdesc="Shadowsocks GUI client"
arch=("i686" "x86_64")
url="https://github.com/shadowsocks/shadowsocks-gui"
license=("Custom")
options=(!strip)

# build options
_buildBinary=false # choose whether to build binary file or not

source=(
  "https://github.com/shadowsocks/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}-binary.desktop"
  "${pkgname}.desktop"
  "${pkgname}.sh"
)

md5sums=('11b5d30de885cc9eac908818737ffbfa'
         '7229b632700df5c241424bd7fde9298a'
         '05e7ab9f056103278425d4bde60161dc'
         '4fd84baa88b2b831a3a2aa1626942f7f')

makedepends=("nodejs" "node-webkit")

if [[ $_buildBinary = true ]]; then
  makedepends+=("zip")
else
  depends+=("node-webkit")
fi

function buildBinary() {
  msg "preparing nw file"
  zip -r ../${pkgname}.nw *

  cd ../
  cat /usr/bin/nw ${pkgname}.nw > ${pkgname}
  msg "build done"
}

function installWithBinary() {
  install -Dm 644 ${srcdir}/${pkgname}-binary.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm 644 /usr/lib/node-webkit/nw.pak ${pkgdir}/opt/${pkgname}/
  install -Dm 644 ${srcdir}/${pkgname}-${pkgver}/icon.png ${pkgdir}/opt/${pkgname}/
  install -Dm 755 ${srcdir}/${pkgname} ${pkgdir}/opt/${pkgname}
  ln -s /opt/${pkgname}/${pkgname}  ${pkgdir}/usr/bin/${pkgname}
}

function installWithNw() {
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm 755 ${srcdir}/${pkgname}.sh  ${pkgdir}/usr/bin/${pkgname}
  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/
}

build() {
  cd ${pkgname}-${pkgver}

  msg "fixing npm install err"
  sed -i 's/0.4/0.4.0/g' package.json

  msg "installing node modules"
  npm install

  if [[ $_buildBinary = true ]]; then
    msg "building binary files"
    buildBinary
  else
    depends+=("node-webkit")
    msg "skip building binary files"
  fi
}

package() {
  msg "copying files"
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/usr/bin

  install -Dm 644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  if [[ $_buildBinary = true ]]; then
    installWithBinary
  else
    installWithNw
  fi
}