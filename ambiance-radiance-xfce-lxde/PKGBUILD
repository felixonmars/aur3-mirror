# Maintainer: grimi <grimi at poczta dot fm>
# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='ambiance-radiance-xfce-lxde'
pkgver='14.04.3'
pkgrel=1
pkgdesc="Ambiance & Radiance themes for Xfce and LXDE"
arch=('any')
license=('GPL2')
url="http://ravefinity.blogspot.com/"
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=("${pkgname}-${pkgver}.tar.gz::https://docs.google.com/uc?id=0B7iDWdwgu9QAa0pEcmVaSHMxZjg&export=download")
md5sums=('4057686bc6ca25eac9a189334ad8d677')

package() {
    find {Ambiance,Radiance}-XFCE-LXDE -type f \
        -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
}
