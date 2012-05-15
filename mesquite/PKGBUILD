# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=mesquite
pkgver=2.75
pkgrel=1
pkgdesc="A software package for evolutionary biology, designed to analyze comparative data about organisms"
arch=('any')
url="http://www.mesquiteproject.org/"
license=('LGPL')
depends=('java-runtime')
source=("http://www.mesquiteproject.org/mesquiteDownload/${pkgname}.tgz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('b8a046843a3013afc16d6d09a618470c'
         '8b62ba93f95aab14a8643bf5b939f465'
         'ef6d47b0a7aa27329165b1185982678e'
         '79604254490c2d8bbcbf54719ac99b6a')

package() {
  cd "${srcdir}/Mesquite_Folder"

  # Remove Windows / Mac OS X launchers
  rm *.{command,bat}

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 '{}' \;

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
