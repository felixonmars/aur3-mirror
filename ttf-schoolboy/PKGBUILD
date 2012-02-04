pkgname=ttf-schoolboy
pkgver=2.0
pkgrel=3
pkgdesc="SchoolBoy font"
arch=('any')
url="http://kde-look.org/content/show.php/SchoolBoy+Text+%5Bupdated%5D?content=110806"
license=('Creative Commons')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.kde-look.org/CONTENT/content-files/110806-Schoolboy%20Text.ttf)
md5sums=('aed8bfc7190c8b7863a613612c2e9cee')

build() {
	install -Dm644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF/SchoolBoy.ttf
}
