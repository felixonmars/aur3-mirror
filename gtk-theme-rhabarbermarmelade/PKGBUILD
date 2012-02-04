# Contributor: ahmad200512<@>yandex.ru

pkgname=gtk-theme-rhabarbermarmelade
pkgver=1.0
pkgrel=1
pkgdesc="Color clone of nifty Qt theme to GTK+, based on Hanso"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gtk-engine-murrine-git')
url=('http://zhuravlik26.deviantart.com/art/Rhabarber-marmelade-GTK-160235641')
source=("http://fc06.deviantart.net/fs70/f/2010/100/2/1/Rhabarber_marmelade_GTK_by_zhuravlik26.gz")
md5sums=('028b809ef0e3130967d2df58a1958925')

build() {
  mkdir -p $pkgdir/usr/share/themes/RhabarberMarmeladeGTK
  cp -r $srcdir/Rhabarbemarmelade/* $pkgdir/usr/share/themes/RhabarberMarmeladeGTK/
}
