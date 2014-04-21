# Maintainer: xenatt <exenatt at gmail dot com>
# Contributor: xenatt  <exenatt at gmail dot com>

pkgname=thecircle-icon-theme
pkgver=20140420
pkgrel=1
pkgdesc="Circle style icon theme this icon theme port from The Circle for Mac"
url="https://github.com/xenatt/linux/"
arch=('any')
license=('custom:Creative Commons')
source=("https://dl.dropboxusercontent.com/u/2805965/TheCircle.zip")
options=(!strip)
sha1sums=('3fa82ae292a8100ab024781f673f70c5ac54ed7f')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -r TheCircle "${pkgdir}/usr/share/icons/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
  
  install -Dm644 "${pkgdir}/usr/share/icons/TheCircle/ABOUT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

