# Contributor: M Rawash <mrawash@gmail.com>
pkgname=gtk2-gilouche-theme
pkgver=23062006
pkgrel=1
url="http://art.gnome.org/themes/gtk2/1284"
pkgdesc="Theme from open/SUSE by Jakub Steiner, Garrett LeSage. Based on Clearlooks."
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://art.gnome.org/download/themes/gtk2/1284/GTK2-Gilouche.tar.gz)
md5sums=('1927bab8eb8e059523675b68ef11eee8')

build() {
  mkdir -p "$pkgdir/usr/share/themes"
  mv -v "$srcdir/Gilouche" "$pkgdir/usr/share/themes"
}
