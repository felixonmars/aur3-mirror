# Maintainier Miguel Aguilar <zodiac_es@yahoo.es>
pkgname=steampunk-cursor-theme
pkgver=1.0
pkgrel=3
pkgdesc="Steampunk cursor theme."
arch=('any')
url="http://kde-look.org/content/show.php/SteampunK+Cursor+Theme?content=161001"
license=('CCPL-by-sa')
source=("http://kde-look.org/CONTENT/content-files/161001-SteampunK.tar.gz")

md5sums=('9ba6b2ecd9b67c71973928c924eb5f7b')

package() {
    cd $srcdir/SteampunK
    install -d $pkgdir/usr/share/icons/Steampunk
    cp -rf *   $pkgdir/usr/share/icons/Steampunk
    chmod -R 644 $pkgdir/usr/share/icons/Steampunk/*
    chmod 755 $pkgdir/usr/share/icons/Steampunk
    chmod 755 $pkgdir/usr/share/icons/Steampunk/cursors
}



