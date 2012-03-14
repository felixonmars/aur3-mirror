# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=meliae-icon-theme
pkgver=0.7
pkgrel=2
pkgdesc="Meliae icon theme"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Meliae?content=88482"
license=('GPL')
source=('http://dl.dropbox.com/u/24716740/mirror/Meliae.tar.gz'
        'http://dl.dropbox.com/u/24716740/mirror/MeliaeWhite.tar.gz')
md5sums=('e231b0ded8d9693e0620b607df9ef48c'
         'f7aabd311d65483e1afcc96f06500f52')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -r "$srcdir/Meliae" "$srcdir/MeliaeWhite" "$pkgdir/usr/share/icons"
	find "$pkgdir" -type f -exec chmod 644 {} \;
}
