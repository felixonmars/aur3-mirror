# Contributor: ahmad200512<@>yandex.ru

pkgname=gtk-theme-gtkstrict
pkgver=1.0
pkgrel=2
pkgdesc="Strict GTK+ theme based on Murrine Compact"
arch=('any')
license=('GPL')
depends=('gtk2')
url=('http://zhuravlik26.deviantart.com/art/GtkStrict-157345571')
source=("http://fc04.deviantart.net/fs70/f/2010/074/0/0/GtkStrict_by_zhuravlik26.gz" "nowarn.patch")
md5sums=('52fc164a5e541e13cb453b1a733045e6' '5a8e88582985396a6fb043c6b719f933')

build() {
  cd $srcdir
  patch -Np1 -i nowarn.patch
  mkdir -p $pkgdir/usr/share/themes/GtkStrict
  cp -r $srcdir/GtkStrict/* $pkgdir/usr/share/themes/GtkStrict/
}
