# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=plymouth-steampunk
pkgver=1.0
pkgrel=1
url="http://kde-look.org/content/show.php/SteampunK+Plymouth+Theme?content=146030"
pkgdesc="This item is a part of Steam-Powered Linux KDE theme set."
arch=('any')
license=('GPL')
depends=('plymouth')
options=('')
install='plymouth-SteampunK.install'
source=("http://sites.google.com/site/binaryinspiration/download/SPL_Plymouth.tar.gz")

md5sums=('825a79ff467b6e1e32b14781f4ea05be')
#('d1a92e9f3b27a963009885b719b23f1f'
package() {
    cd $srcdir/SteampunK
    mkdir -p $pkgdir/usr/share/plymouth/themes/SteampunK
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/SteampunK
}

