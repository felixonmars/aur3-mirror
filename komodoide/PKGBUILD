# Maintainer: JokerBoy <jokerboy at punctweb dot ro>

pkgname=komodoide
pkgver=8.0.1_78128
pkgrel=1
pkgdesc="Proprietary version of ActiveState Komodo Edit - Based on XUL"
arch=('i686' 'x86_64')
url="http://www.activestate.com/komodo-ide"
license=('MPL')
depends=('glibc>=2.4' 'libjpeg>=6.2' 'gcc-libs' 'gtk2')
optdepends=('xterm: for komodo-toolbox')
[ "$CARCH" = "i686" ] && _arch="x86" && md5sums=('dcec551a89d277341ec1458bfd291a3c')
[ "$CARCH" = "x86_64" ] && _arch="x86_64" && md5sums=('55e06b0a1402b8940d712fa5d50da13b')
source=("http://downloads.activestate.com/Komodo/releases/${pkgver%_*}/Komodo-IDE-${pkgver/_/-}-linux-${_arch}.tar.gz")
install=komodoide.install
options=(!strip)

package() {
  cd "${srcdir}/Komodo-IDE-${pkgver/_/-}-linux-${_arch}"
  ./install.sh -s -I "${pkgdir}/opt/${pkgname}" --dest-dir "/opt/${pkgname}"
  install -d "${pkgdir}"/usr/{bin,share/applications}
  ln -s "/opt/${pkgname}/share/desktop/komodo-ide-8.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ln -sf "/opt/${pkgname}/lib/mozilla/komodo" "${pkgdir}/opt/${pkgname}/bin/komodo"
  ln -s "/opt/${pkgname}/lib/mozilla/komodo" "${pkgdir}/usr/bin/${pkgname}"
  grep -r -lZ "$pkgdir" "$pkgdir" 2>/dev/null | while read -rd '' file; do sed -i "s|$pkgdir||g" "$file"; done
}
