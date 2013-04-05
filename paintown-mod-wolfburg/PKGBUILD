# Maintainer: Zsolt Udvari <udvzsolt gmail com>
pkgname=paintown-mod-wolfburg
pkgver=1.0
pkgrel=1
pkgdesc="Wolfburg mod to paintown"
arch=(any)
url="http://paintown.sourceforge.net/index.php?page=mods"
license=('GPL')
depends=(paintown)
source=(https://sourceforge.net/projects/paintown/files/mods/wolfburg/wolfburg-${pkgver}.zip)
noextract=(wolfburg-${pkgver}.zip)
md5sums=('d92c6fb69d489cac5aa399fef4ca4cf9')

build() {
    true
}

package() {
    install -d $pkgdir/usr/share/paintown/data
    cd $pkgdir/usr/share/paintown/data
    unzip $srcdir/wolfburg-${pkgver}.zip
}
