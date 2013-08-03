# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=vdconverter
pkgver=1.0
pkgrel=1
pkgdesc="Simple program to convert videos to popular video formats."
arch=(any)
url=("http://smithux.com")
depends=('xdialog' 'ffmpeg' 'bc')
conflicts=('vdconverter>1.0')
license=('GPL')
source=("https://dl.dropboxusercontent.com/u/4813005/$pkgname/${pkgname}-${pkgver}.tar.gz")
md5sums=('4b0e1a58f66f732bca6e937bf7678d8e')

package() {	
    mkdir -p $pkgdir/usr/{bin,share/{applications,pixmaps}}
    cp -r $srcdir/locale $pkgdir/usr/share/
    install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/
    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
    install -Dm 644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps		
}
