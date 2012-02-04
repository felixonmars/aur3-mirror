# Contributor: ahmad200512<@>yandex.ru

pkgname=gtk-theme-beauty-in-black
pkgver=1.0
pkgrel=1
pkgdesc="Strict GTK+ theme based on Murrine Compact"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=('http://zhuravlik26.deviantart.com/art/Beauty-in-Black-GTK-177993193')
source=("http://fc02.deviantart.net/fs70/f/2010/247/0/5/beauty_in_black_gtk_by_zhuravlik26-d2xz0fd.zip")
md5sums=('9f1a52e8daf6f5fe4f3ac7cd2018b686')

build() {
  mkdir -p $pkgdir/usr/share/themes/Beauty-in-Black
  cp -r $srcdir/BeautyInBlackGTK/* $pkgdir/usr/share/themes/Beauty-in-Black
}
