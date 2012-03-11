# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=pcsx2ce
pkgver=0.27
pkgrel=1
_aid=25242 # attachment id
pkgdesc="A cheat codes converter and pnatch file editor for PCSX2."
arch=(any)
url="http://forums.pcsx2.net/Thread-PCSX2CE-PCSX2-Cheat-Converter-Patch-File-Editor"
license=('custom:CC-BY-ND-3')
depends=('java-environment' 'bash')
makedepends=('unzip')
optdepends=('pcsx2: run and test cheats codes')
source=(PCSX2CE.zip::"http://forums.pcsx2.net/attachment.php?aid=${_aid}"
        'pcsx2ce.sh' 'pcsx2ce.desktop' 'sun-java.png' 'license.txt')
md5sums=('0b4cd8d643d33a17726d29f8d578e13f'
         'a43d87ce799e0a7d645fdc4d794e3648'
         '9014c07b49699ac58cd740184716ff77'
         '1db7eb33e844d1a41bce196ab622da40'
         '932794f87f28d7332a98ddab0c65ad5d')

package() {
  cd "${srcdir}"
  install -Dm755 PCSX2CE.jar "${pkgdir}"/usr/share/${pkgname}/pcsx2ce.jar
  install -Dm755 pcsx2ce.sh "${pkgdir}"/usr/bin/pcsx2ce
  install -Dm644 pcsx2ce.desktop "${pkgdir}"/usr/share/applications/pcsx2ce.desktop
  install -Dm644 sun-java.png "${pkgdir}"/usr/share/pixmaps/sun-java.png
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

