# Maintainer: Torsten Martin <yaourt at web dot de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>
# Contributor: Michael Liptrap <xenobrain@gmail.com>

pkgname=pcgen
pkgver="6.04.01"
pkgrel=1
pkgdesc="An open source RPG character generator and maintenance program"
arch=('any')
url="http://pcgen.sourceforge.net/"
license=('LGPL' 'custom')
depends=('java-environment')

source=("http://downloads.sourceforge.net/project/pcgen/PCGen%20Stable/6.04.01/pcgen-6.04.01-full.zip"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")

md5sums=('b78670c80425d5314556e80007fe5199'
         '246dbbc6267dc3c1c3e29b86f8d04e27'
         '74f84ab162a7c9237ae3395300659dab'
         '811ec47d177116db1d46bb1a24912641')

package() {
  cd "${srcdir}/${pkgname}"

# Install program files
  rm -f *.bat *.exe
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -rf * "${pkgdir}/usr/share/${pkgname}"

# Set file permissions
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 '{}' \;
  chmod 755 "${pkgdir}/usr/share/${pkgname}/"*.sh
  chmod 666 "${pkgdir}/usr/share/${pkgname}/"*.properties

# Install launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

# Install icon
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

# Install .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

# Install licenses
  cd docs/acknowledgments
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 {ogllicense,publishersandsources,skinlflicense}.html \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
