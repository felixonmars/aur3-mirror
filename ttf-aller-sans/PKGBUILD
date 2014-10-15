pkgname=ttf-aller-sans
pkgver=2014.10.15
pkgrel=1
pkgdesc="Excellent UI and screen-legible typeface designed by Dalton Maag."
arch=(any)
depends=(fontconfig xorg-font-utils)
url=("http://www.fontsquirrel.com/fonts/aller")
source=("http://sourceforge.net/projects/myfavfonts/files/ttf-aller-sans.zip")
install=$pkgname.install
md5sums=('f96e75f779b49602f9801cad1dd5835c')
license=('GPL')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
