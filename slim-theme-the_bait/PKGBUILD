pkgname=slim-theme-the_bait
pkgver=1
pkgrel=5
pkgdesc='A minimal SLiM theme based on "The Bait" wallpaper'
url="http://www.archlinux.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('slim')
groups=('slim-themes')
install="the_bait.install"
source=("$pkgname-$pkgver.tar.gz" "the_bait.install")
md5sums=('927550861b691875e7eb3b9af6efb2d7' '4bdb02062dd54306557401456ab004f5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -m 644 -D background.png $startdir/pkg/usr/share/slim/themes/the_bait/background.png
  install -m 644 -D panel.png $startdir/pkg/usr/share/slim/themes/the_bait/panel.png
  install -m 644 -D slim.theme $startdir/pkg/usr/share/slim/themes/the_bait/slim.theme
  install -m 644 -D preview.png $startdir/pkg/usr/share/slim/themes/the_bait/preview.png
  install -m 644 -D README $startdir/pkg/usr/share/slim/themes/the_bait/README
}
