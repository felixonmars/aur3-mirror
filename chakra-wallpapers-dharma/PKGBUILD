# Maintainer: Ivan Petruk <localizator@ukr.net>

pkgname=chakra-wallpapers-dharma
pkgver=0.2
pkgrel=1
pkgdesc="Chakra Dharma Theme Wallpapers by Malcer for KDE Chakra "
url="http://www.chakra-project.org"
license=("GPL" "Creative Commons, BY-SA-NC")
arch=('any')
makedepends=('automoc4')
groups=("kde")
source=("dharma.tar.gz::https://dl.dropboxusercontent.com/u/24598537/build/dharma.tar.gz")
md5sums=('b784dace7eccca15fa9eea45b133be63')

package() {
	cd ${srcdir}/dharma
    
        mkdir -pv ${pkgdir}/usr/share/wallpapers/dharma/contents/
        cd ${srcdir}/dharma/contents
        cp -Rv * ${pkgdir}/usr/share/wallpapers/dharma/contents/
        cd $pkgdir/usr/share/wallpapers/dharma/contents/
 
        cp -v ${srcdir}/dharma/metadata.desktop $pkgdir/usr/share/wallpapers/dharma
        cp -v ${srcdir}/dharma/contents/screenshot.png $pkgdir/usr/share/wallpapers/dharma/contents
}        