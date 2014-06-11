# Maintainer: Johnny Huang <hzqtc1229@gmail.com>
# Contributor: Joel Almeida <aullidolunar at gmail dot com>

pkgname=xfwm4-theme-minimal
pkgver=0.2
pkgrel=1
pkgdesc="Minimal xfwm theme, with mouseover effects"
arch=('any')
url=("http://xfce-look.org/content/show.php/XFWM+-+Minimal-gtk?content=139915")
license=('GPL')
depends=('xfwm4')
source=("${pkgname}.tar.gz::http://xfce-look.org/CONTENT/content-files/139915-minimal-gtk.0.2.tar.gz")
md5sums=('fe398405256f0036beda67cf12ac12e1')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	find "minimal-gtk" -name "*" -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}
