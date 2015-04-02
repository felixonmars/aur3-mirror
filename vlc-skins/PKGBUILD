# Contributor: Flow

pkgname=vlc-skins
pkgver=20150401
pkgrel=1
pkgdesc="Skins packs for vlc"
arch=('any')
license=('custom')
url="http://www.videolan.org"
depends=("vlc")
source=("http://www.videolan.org/vlc/skins2/vlc-skins.zip")
md5sums=SKIP

build() {
   cd "${srcdir}/"

}

package() {
   cd "${srcdir}/"
   mkdir -p ${pkgdir}/usr/share/vlc/skins2/
   cp ${srcdir}/*.vlt ${pkgdir}/usr/share/vlc/skins2/
}


