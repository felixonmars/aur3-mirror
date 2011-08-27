# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=gtk-black-diamond-theme
pkgver=0.5
pkgrel=3
pkgdesc="A Dark theme based on Ubuntu DarkRoom Colorscheme"
arch=('any')
url="http://xfce-look.org/content/show.php/Black-Diamond?content=94653"
license=('GPL')
depends=('gtk-engine-murrine-git') # requires murrine engine 0.99.3 or higher
source=("http://xfce-look.org/CONTENT/content-files/94653-Black-Diamond.tar.gz")
md5sums=('f04a51651b07c1ce6e3097e8786d9ee5')

package() {
 mkdir -p "$pkgdir/usr/share/themes"
 cp -R "$srcdir/Black-Diamond" "$pkgdir/usr/share/themes"
}
