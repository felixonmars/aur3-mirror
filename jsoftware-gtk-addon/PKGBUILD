# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-gtk-addon
pkgver=1.0.1
pkgrel=3
pkgdesc="gtk API for J programming language"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware' 'gtk2')
source=(http://www.jsoftware.com/jal/j602/addons/gui_gtk_${pkgver}_linux.tar.gz)
md5sums=('6a3eefbd3e9c8967f2205b30f1a52237')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a gui $startdir/pkg/usr/lib/j/addons/
}
