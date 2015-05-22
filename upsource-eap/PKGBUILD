# Maintainer: Gauthier P. <kendos dot kenlen at gmail dot com>
# Base on Upsource PKGBUILD by windy

pkgname=upsource-eap
pkgver=2.0.3462
pkgrel=1
pkgdesc='Early access version of the upcoming version of Upsource'
arch=('any')
url="https://www.jetbrains.com/upsource/"
license=('Commercial')
depends=('jre8-openjdk')
conflicts=('upsource')
install="$pkgname.install"
source=("https://download.jetbrains.com/upsource/upsource-${pkgver}.zip"
        'upsource.service'
	'upsource.conf')
sha256sums=('5efe4a3b2167acde2a7828c3c1a5e76d9488fa9089dd48773c5d72fa9d6ad3e6'
            'ade10fd82db2c5adc27e83350201e823ffbd4b1b0d26dd6deee09213eda0f03c'
            '2cd2efca36584c8cdf92d31eaf6305606688d3bb6d6ebdbf604b6134c618a63c')
options=('!strip')

package() {
  mkdir -p "${pkgdir}/usr/share/licenses"
  mkdir -p "${pkgdir}/var/lib/upsource"
  mkdir -p "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/upsource.service" "${pkgdir}/usr/lib/systemd/system/upsource.service"
  install -Dm755 "${srcdir}/upsource.conf" "${pkgdir}/etc/conf.d/upsource"
  # Java for Windows or MacOS is not needed
  rm -rf "${srcdir}/Upsource/internal/java"
  cp -R "${srcdir}/Upsource"/* "${pkgdir}/opt/${pkgname}"
}
