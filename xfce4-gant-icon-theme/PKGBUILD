# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-gant-icon-theme
pkgver=3.9_6
pkgrel=2
pkgdesc="Gant icon theme for XFCE"
arch=('any')
url="http://xfce-look.org/content/show.php/GANT?content=23297"
license=('GPL')
source=("http://overlay.uberpenguin.net/icons-xfce-gant-${pkgver/_/-}.tar.bz2")
md5sums=('b31d1de7ba52b9db2bc00426a2612058')

package() {
 mkdir -p "$pkgdir/usr/share/icons"
 cp -R "$srcdir/Gant.Xfce" "$pkgdir/usr/share/icons"
}
