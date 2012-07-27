pkgname=slim-theme-elegant-brit
pkgver=2
pkgrel=1
pkgdesc='A minimal SLiM theme based on the Elegant Brit GTK theme and Brit Waves GDM Theme'
url="http://www.archlinux.org"
arch=('any')
license=('LGPL')
depends=('slim')
groups=('slim-themes')
install="slim-theme-elegant-brit.install"
source=("$pkgname-$pkgver.tar.xz" "slim-theme-elegant-brit.install")
md5sums=('27d95a35a5377a58b727d7e1a9019b55' '08d374546bc63561b7771e02a02f0099')

build() {
  cd $startdir/src/
  install -m 644 -D background.jpg $startdir/pkg/usr/share/slim/themes/elegant_brit/background.png
  install -m 644 -D panel.png $startdir/pkg/usr/share/slim/themes/elegant_brit/panel.png
  install -m 644 -D slim.theme $startdir/pkg/usr/share/slim/themes/elegant_brit/slim.theme
}
