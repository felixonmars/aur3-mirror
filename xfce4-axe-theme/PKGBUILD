# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-axe-theme
pkgver=0
pkgrel=2
pkgdesc="Another Xfwm themE (axe) is a minimalistic theme which picks up your gtk colors"
arch=('any')
url="http://xfce-look.org/content/show.php/axe?content=73291"
license=('GPL')
source=('http://xfce-look.org/CONTENT/content-files/73291-axe.tar.gz')
md5sums=('eeab5ae82b6b2535a0d37930cf463d6b')

build() {
 mkdir -p "$pkgdir/usr/share/themes"
 cp -R "$srcdir"/{axe,axe\ rounded} "$pkgdir/usr/share/themes"
}
