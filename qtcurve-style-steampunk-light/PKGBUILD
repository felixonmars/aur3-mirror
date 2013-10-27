# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=qtcurve-style-steampunk-light
pkgver=1.0
pkgrel=4
pkgdesc="SteampunK QtCurve light theme. This item is a part of Steam-Powered Linux KDE theme set."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=142139"
license=('CCPL-by-sa')
groups=(steam-powered-linux)
depends=('qtcurve-kde4')
optdepends=('qtcurve-gtk2')
source=(http://sites.google.com/site/binaryinspiration/download/SteampunkLight.qtcurve)
md5sums=('041a41da25368cd533687232fe5c3c18')

package() {
   install -d $pkgdir/usr/share/apps/QtCurve
   cp -rf Steampun* $pkgdir/usr/share/apps/QtCurve
   cat $srcdir/SteampunkLight.qtcurve | \
                  sed -r 's/SteampunkLight-bgnd.png/\/usr\/share\/apps\/QtCurve\/SteampunkLight-bgnd.png/' > \
                 $pkgdir/usr/share/apps/QtCurve/SteampunkLight.qtcurve

   chmod 644 $pkgdir/usr/share/apps/QtCurve/*
}
