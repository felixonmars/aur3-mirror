# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=juststyle
pkgver=1.3.3
_pkgver=`echo $pkgver | sed 's|\.||g'`
pkgrel=2
pkgdesc="JustStyle CSS Editor"
arch=("i686" "amd64")
url="http://www.ucware.com/juststyle"
license=()
groups=()
depends=('jre')
makedepends=('unzip')
makedepends=()
source=("http://www.ucware.com/${pkgname}/${pkgname}-${_pkgver}-java-nojre.zip"
        "juststyle"
        "juststyle.png"
        "juststyle.desktop")
noextract=("*.zip")
license=("custom")
md5sums=('6fc9f2c5de08d00b0848532d8caae637'
         'b672416afe61a1d7e13df672a4015285'
         '298412873e376a8858903a17076e1a01'
         'd4922463bc9622a5fe3942e16954f300')

package() {
  cd "$srcdir"

  install -d "${pkgdir}/opt/juststyle"
  cd "${pkgdir}/opt/juststyle"

  unzip "${srcdir}/${pkgname}-`echo ${pkgver} | sed 's|\.||g'`-java-nojre.zip" -d .

  rm -rf windows os2 linux

  install -Dm0755 "${srcdir}/juststyle" "${pkgdir}/usr/bin/juststyle"
  install "${srcdir}/juststyle.png" "${pkgdir}/opt/juststyle/juststyle.png"
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/juststyle.desktop" "${pkgdir}/usr/share/applications/juststyle.desktop"

  # Fix permissions
  chmod 755 "${pkgdir}/opt/juststyle/juststyle.jar"
}


# vim:set ts=2 sw=2 et:
