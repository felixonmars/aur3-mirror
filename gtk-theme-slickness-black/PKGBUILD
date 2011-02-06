# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=gtk-theme-slickness-black
pkgver=0.9
pkgrel=1
pkgdesc="Slickness GTK 2.0 dark theme"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=('http://www.gnome-look.org/content/show.php/Slickness+Black?content=73210')
source=(http://www.gnome-look.org/CONTENT/content-files/73210-SlicknesS-black.tar.gz)
md5sums=('578c1943fa620720520eb4efec344a49')

build() {
  mkdir -p $pkgdir/usr/share/themes/SlicknesS-black
  cp -r $srcdir/SlicknesS-black/gtk-2.0 $pkgdir/usr/share/themes/SlicknesS-black/
}
