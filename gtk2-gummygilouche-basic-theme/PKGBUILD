# Contributor: M Rawash <mrawash@gmail.com>
pkgname=gtk2-gummygilouche-basic-theme
pkgver=0.1
pkgrel=1
url="http://www.gnome-look.org/content/show.php/GummyGilouche-Basic?content=90029"
pkgdesc="Based on the GummyGilouche theme (used in openSUSE) and original Gilouche"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://www.gnome-look.org/CONTENT/content-files/90029-GummyGilouche-Basic.tar.gz)
md5sums=('cc6af9a6838e8b2e2534dc7b1f848f54')

build() {
  mkdir -p "$pkgdir/usr/share/themes"
  mv -v "$srcdir/GummyGilouche-Basic" "$pkgdir/usr/share/themes"
}
