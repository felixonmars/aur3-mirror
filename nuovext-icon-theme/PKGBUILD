# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=nuovext-icon-theme
pkgver=1.7
_kdever=1.6
pkgrel=1
pkgdesc="A chique iconset"
arch=('any')
url="http://nuovext.pwsp.net/"
license=('GPL')
source=()
source=("http://nuovext.pwsp.net/files/nuoveXT-$pkgver.tar.gz"
        "http://nuovext.pwsp.net/files/nuoveXT-kde-"$_kdever".tar.gz")
md5sums=('991b3d554847569feca947f21feefdef'
         '5667676200403755c171b48904961f39')


package() {
    find -type f -exec chmod 644 {} \;

    install -d $pkgdir/usr/share/icons/
    
    cp -rf $srcdir/nuoveXT-$pkgver/ $pkgdir/usr/share/icons/nuoveXT/
    cp -rf $srcdir/nuoveXT-kde-"$_kdever"/ $pkgdir/usr/share/icons/nuoveXT-kde/
    
}
