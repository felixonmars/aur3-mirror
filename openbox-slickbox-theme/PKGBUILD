# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=openbox-slickbox-theme
_tname="SlickBox"
pkgver=2008.07.28
pkgrel=1
pkgdesc="Slick OpenBox Theme"
arch=('any')
url="http://box-look.org/content/show.php/SlickBox?content=79343"
license=('GPL')
depends=('openbox>=3.0' )
source=(http://box-look.org/CONTENT/content-files/79343-$_tname.tar.bz2)
md5sums=('56a5c3aa6e75f753b921e2b45b75651d')

build() {
  mkdir -p $pkgdir/usr/share/themes/
  cd $srcdir/$_tname/openbox-3/
  mv themerc themerc.old
  sed -e 's/window.handle.width: 1/window.handle.width: 3/'<themerc.old >themerc
  cp -r $srcdir/$_tname $pkgdir/usr/share/themes/
}
