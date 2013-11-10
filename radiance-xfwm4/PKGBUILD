#Maintainer: Mamut Ghiunhan <venerix@blug.ro>
pkgname=radiance-xfwm4
pkgver=0.1
pkgrel=1
pkgdesc="Radiance theme for Xfwm"
arch=('i686' 'x86_64')
url="http://xfce-look.org/content/show.php/Radiance-xfwm4?content=161714"
license=('GPL')
depends=('xfwm4')
source=(http://xfce-look.org/CONTENT/content-files/161714-$pkgname-$pkgver.tar.gz)
md5sums=('57f4b9c6d7fee70523b0c72e07deb4d0')

package() {
	cd $srcdir/$pkgname-$pkgver
	install -m 755 -d $pkgdir/usr/share/themes
	cp -avx $pkgname $pkgdir/usr/share/themes
}
