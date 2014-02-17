# Maintainier Miguel Aguilar <zodiac_es@yahoo.es>

pkgname=kdeartwork-aurorae-steampunk
pkgver=1.0
pkgrel=3
pkgdesc="SteampunK Aurorae Theme is part of Steam-Powered Linux KDE theme set."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=158790"
license=('GPL')
depends=('kdebase-workspace')
groups=(steam-powered-linux)
source=(http://kde-look.org/CONTENT/content-files/158790-SteampunK.tar.gz)
md5sums=('bcc2ca433f775c4848f84eb6a0ca7267')

package() {
   cd $srcdir/SteampunK
   install -dm 755 $pkgdir/usr/share/apps/aurorae/themes/SteampunK
   install -m 644 *   $pkgdir/usr/share/apps/aurorae/themes/SteampunK
}

