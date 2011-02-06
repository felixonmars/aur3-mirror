# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=gtk-theme-darkway
pkgver=1
pkgrel=2
pkgdesc="A darker gray flat gtk2 theme/style"
arch=('i686' 'x86_64' 'ppc')
url="http://gnome-look.org/content/show.php/DarkWay?content=64653"
license=('GPL')
depends=('gtk2' 'gtk-engines')
source=(http://gnome-look.org/CONTENT/content-files/64653-DarkWay.tar.gz)
md5sums=('2ac23b208041795dbecfb87fbce588db')


build() {
  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/DarkWay $pkgdir/usr/share/themes/
}
