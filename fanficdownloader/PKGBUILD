pkgname=fanficdownloader
pkgver=0.8.9
pkgrel=2
pkgdesc="Tool to download fanfictions from different sources and convert them into various eBook formats"
arch=('i686')
url="http://www.fanfictiondownloader.net/download.php"
license=('proprietary')
depends=(qt5-base qt5-script)      
makedepends=(unzip)
optdepends=(calibre)
source=(http://www.fanfictiondownloader.net/ffdl-linux.zip)
md5sums=('77489bfd4bd15da76062acd6b5e560a3')
           
package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/bin/"
  mv "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$srcdir/fanficdownloader" "$pkgdir/usr/bin/fanficdownloader"
  chmod +x "$pkgdir/usr/bin/fanficdownloader"
}
