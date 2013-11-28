#Maintainer: max-k <max-k AT post DOT com>
pkgname=passkeychanger
_pkgname=PasskeyChanger
pkgver=0.1.0.0
pkgrel=1
pkgdesc="This is program for change passkey in torrent files."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/${_pkgname}?content=143953"
license=('GPL3')
depends=('qt4')
makedepends=('cmake')
source=("https://github.com/panter-dsd/PasskeyChanger/archive/0.1.0.0.zip")
md5sums=('0d8385c1bf66edb56ab914651a84efa4')
sha256sums=('e31afc8ed6e051d7a877771ff75ea56577ca4db3162d9a7b9ae2944735b46ab7')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm 755 passkeychanger ${pkgdir}/usr/bin/passkeychanger
  mkdir -p ${pkgdir}/usr/share/passkeychanger/translations
  install -Dm 644 share/translations/passkeychanger_ru.qm \
                  ${pkgdir}/usr/share/passkeychanger/passkeychanger_ru.qm
  install -Dm 644 share/translations/passkeychanger_ru.ts \
                  ${pkgdir}/usr/share/passkeychanger/passkeychanger_ru.ts
}
