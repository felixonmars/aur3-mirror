# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=kdeartwork-colorschemes-steampunk-light
pkgver=3.0
pkgrel=2
pkgdesc="SteampunK KDE color-schemes. This item is a part of Steam-Powered Linux KDE theme set."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=142139"
license=('CCPL-by-sa')
groups=(steam-powered-linux)
depends=('kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/155868-SteampunKLight.colors)
md5sums=('03d820cdbfd8b1d0a4d9996868247ea8')

package() {
   cd $startdir/src/
   install -dm 755  $pkgdir/usr/share/apps/color-schemes/
   install -Dm 644  155868-SteampunKLight.colors $pkgdir/usr/share/apps/color-schemes/SteampunKLight.colors
}
