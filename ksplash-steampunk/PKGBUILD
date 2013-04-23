# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=ksplash-steampunk
pkgver=3.0
pkgrel=5
pkgdesc="SteampunK for Ksplash. This item is a part of Steam-Powered Linux KDE theme set."
arch=('any')
url="http://kde-look.org/content/show.php/SteampunK+Plymouth+Theme?content=146030"
license=('CCPL-by-sa')
groups=(steam-powered-linux)
depends=('kdebase-workspace')
source=("http://sites.google.com/site/binaryinspiration/download/SteampunK_KSplash3.tar.gz")
install=ksplash-steampunk.install
md5sums=('e1c3a08a4050a456380a2ea4e62f63df')

package() {
    cd $srcdir/SteampunK
    install -d $pkgdir/usr/share/apps/ksplash/Themes/SteampunK
    cp -rf * $pkgdir/usr/share/apps/ksplash/Themes/SteampunK
    chmod -R 644 $pkgdir/usr/share/apps/ksplash/Themes/SteampunK/*
    chmod 755 $pkgdir/usr/share/apps/ksplash/Themes/SteampunK/{Backgrounds,Animations,2133x1200,1920x1200,1600x1200,1500x1200}
}

