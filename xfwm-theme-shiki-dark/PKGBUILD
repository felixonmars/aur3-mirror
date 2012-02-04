# Maintainer:  Android_808 <android underscore 808 at hotmail dot com>
pkgname=xfwm-theme-shiki-dark
#_pkgname=conky_colors
pkgver=0.1
pkgrel=1
pkgdesc="XFWM4 Shiki Dark theme by sauravzone1"
arch=('any')
url="http://xfce-look.org/content/show.php/Shiki+Dark?content=146478"
license=('GPL')
depends=('xfwm4')
makedepends=('perl')
options="!strip"

source=("http://xfce-look.org/CONTENT/content-files/146478-Shiki-Dark.tar.gz")
md5sums=('bbd11184b2fc1048fd0aa584ef1a7a09')

build() {
  install -d $pkgdir/usr/share/themes
  cp -r $srcdir/Shiki-Dark $pkgdir/usr/share/themes/
}
