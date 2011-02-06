# Contributor: Ertuğrul HAZAR	<ertugrulhazar at gmail dot com>

pkgname=smooth-icon-theme
pkgver=0.1
pkgrel=1
pkgdesc="Smooth icon theme"
arch=('i686' 'x86_64')
url="http://www.xfce-look.org/content/show.php/Smooth?content=103639"
license=('Creative Commons')
source=(http://sites.google.com/site/ertugrulhazar/Smooth-icon-theme.tar.gz)
md5sums=('3255edcab060f574bd195ef6021b1a0c')

build() {
  mkdir -p $pkgdir/usr/share/icons/
  cp -R $srcdir/Smooth/ $pkgdir/usr/share/icons/
}
