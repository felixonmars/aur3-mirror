pkgname=ttf-weblysleekui
pkgver=2014.10.12
pkgrel=1
pkgdesc="Alternative font family to Segoe UI."
url="http://fontpro.com/weblysleek-ui-font-9838"
license=('GPL3')
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("http://sourceforge.net/projects/numix-square-xfwm4/files/fonts/WeblySleekUI.zip")
install=$pkgname.install
md5sums=('d9cb514cd6b6be898399800ae3e8330e')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
