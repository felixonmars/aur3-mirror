pkgname=midna-colors
pkgver=1.0.0
pkgrel=2
pkgdesc="Color scheme for KaOS plasma theme Midna"
arch=('x86_64')
url=("http://kaosx.us")
license=('Artistic 2.0')
source=('Midna.colors')
md5sums=('55a2d5f5fc724a5c63f89070b36435a4')

package() {
       mkdir -p $pkgdir/usr/share/apps/color-schemes
       chmod 755 -R $pkgdir/usr/share/apps/color-schemes

       cd ${srcdir}
       cp Midna.colors $pkgdir/usr/share/apps/color-schemes/midna.colors
} 