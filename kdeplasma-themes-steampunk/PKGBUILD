# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=kdeplasma-themes-steampunk
pkgver=1.1
pkgrel=4
pkgdesc="Steam-Powered Linux Plasma Theme. This item is a part of Steam-Powered Linux KDE theme set."
arch=('any')
url="http://kde-look.org/content/show.php?content=157926"
license=('CCPL-by-sa')
groups=(steam-powered-linux)
depends=('kdebase-plasma')
source=("http://kde-look.org/CONTENT/content-files/157926-SteampunK.tar.gz")

md5sums=('3964f803345a08cc5cd3ec0d57ce1bb7')

package() {
    cd $srcdir/SteampunK

    install -dm 755 $pkgdir/usr/share/apps/desktoptheme/SteampunK/{dialogs,generic,icons,icontasks,wallpapers,widgets}
    
    install -m 644 metadata.desktop $pkgdir/usr/share/apps/desktoptheme/SteampunK/
    install -m 644 dialogs/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/dialogs
    install -m 644 generic/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/generic
    install -m 644 icons/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/icons
    install -m 644 icontasks/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/icontasks
    # install -m 644 wallpapers/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/wallpapers
    install -m 644 widgets/* $pkgdir/usr/share/apps/desktoptheme/SteampunK/widgets
}

