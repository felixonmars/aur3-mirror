# Maintainier: danyf90 <daniele.formichelli@gmail.com>

pkgname=kdeartwork-colorschemes-produkt
_themename=Produkt
pkgver=1.0
pkgrel=1
pkgdesc="A color matching theme for oxygen style matching to the Produkt Plasma theme."
arch=('any')
url="http://kde-look.org/content/show.php?content=124222"
license=('GPL')
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/124222-$_themename.colors")
sha512sums=('d608f3f7ac6731b7f543d42d50a42106e7eaede557e16de0e91118589204e616821b56bcf1dc8a71bf30e22b0540366420ddd6c0be80af6a97a050c2a353d4e9')

package() {
   install -d $pkgdir/usr/share/apps/color-schemes/
   install -D 124222-$_themename.colors $pkgdir/usr/share/apps/color-schemes/$_themename.colors
}
