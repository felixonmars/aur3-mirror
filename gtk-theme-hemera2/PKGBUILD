# Contributor: ahmad200512<@>yandex.ru

pkgname=gtk-theme-hemera2
pkgver=1.0
pkgrel=1
pkgdesc="Light GTK+ theme with smooth color transitions"
arch=('any')
license=('GPL')
depends=('gtk2')
url=('http://zhuravlik26.deviantart.com/art/Hemera2-gtk2-291045146')
source=("http://fc04.deviantart.net/fs70/f/2012/078/0/0/hemera2_gtk2_by_zhuravlik26-d4ta3ve.zip")
md5sums=('bf83084996867dab474abb50592d9fe5')

build() {
  mkdir -p $pkgdir/usr/share/themes/Hemera2
  cp -r $srcdir/Hemera2/* $pkgdir/usr/share/themes/Hemera2
}
