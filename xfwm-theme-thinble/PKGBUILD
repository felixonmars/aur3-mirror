# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>

pkgname=xfwm-theme-thinble
pkgver=0.1
pkgrel=1
pkgdesc="An Xfwm theme with no title bar and a thin border"
arch=('any')
url="http://paldepind.deviantart.com/art/Thinble-362276066"
license=('GPL')
depends=('xfwm4')
source=("https://www.dropbox.com/s/l4l60qc1rviofqg/thinble.tar.gz")
md5sums=('ea49a15c54da1bff3722c6215fef117b')

package() {
  cd $srcdir
  tar -zxf thinble.tar.gz
  mkdir -p "$pkgdir/usr/share/themes/Thinble"
  cp -r "$srcdir/Thinble/xfwm4" "$pkgdir/usr/share/themes/Thinble/"
}
