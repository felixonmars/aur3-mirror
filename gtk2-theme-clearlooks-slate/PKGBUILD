pkgname=gtk2-theme-clearlooks-slate
pkgver=0.1
pkgrel=1
url="http://gnome-look.org/content/show.php?content=122060"
pkgdesc="A nice gtk2 theme for clearlooks"
license=('GPL')
arch=('any')
depends=('gtk-engines')
source=(http://gnome-look.org/CONTENT/content-files/122060-Clearlooks-Slate-v0.1.tgz)
md5sums=('4d1a56281f2b81b6cd2957d51dfaf2cd')

build() {
  mkdir -p "$pkgdir/usr/share/themes/Clearlooks-Slate/"
  mv -v "$srcdir/Clearlooks-Slate/gtk-2.0/" "$pkgdir/usr/share/themes/Clearlooks-Slate/"
}

