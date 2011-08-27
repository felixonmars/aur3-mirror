# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=gdeskcal-skins
pkgver=0.56_3
pkgrel=1
pkgdesc="Common extra skins for gDeskcal"
arch=(any)
url="http://www.filewatcher.com/m/gdeskcal-skins-0.56_3.tgz.32.0.0.html"
license=('GPL')
depends=(gdeskcal)
source=(ftp://ftp.tw.freebsd.org/pub/ports/alpha/packages-4-stable/deskutils/$pkgname-$pkgver.tgz)
md5sums=('a9f3e38300ce918917e84a0d44fdaf63')

build() {
 mkdir -p $pkgdir/usr/lib/gdeskcal
 cp -R $srcdir/share/gnome/gdeskcal/skins $pkgdir/usr/lib/gdeskcal
}
