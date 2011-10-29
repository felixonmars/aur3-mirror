# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-theme-xaphire
pkgver=1.1
pkgrel=1
pkgdesc="Xaphire theme ported from WindowBlinds"
arch=('any')
url="http://xfce-look.org/content/show.php/Xaphire?content=88496"
license=('GPL')
source=('http://downloads.aelys-info.net/sources/usr/share/themes/Xaphire-xfwm4.pack.tar.gz')
md5sums=('28d4ad982bd391cda22d4c0fd03e0e12')

package() {
 mkdir -p "$pkgdir/usr/share/themes"
 cp -R "$srcdir/Xaphire-"{Aqua,$'Ga\303\257a',Lava} "$pkgdir/usr/share/themes"
}
