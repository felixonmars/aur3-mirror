pkgname=emesene-dillo
pkgver=0.2a
pkgrel=1
pkgdesc="The name 'Dillo' is the Italian translation of 'say it'... because this plugin reads the new messages."
arch=('i686' 'x86_64')
url="http://forum.emesene.org/index.php/topic,1352.0.html"
license=('unknown')
depends=('emesene' 'espeak')
makedepends=('patch' 'diffutils')
source=('http://italianmafia.altervista.org/blog/download.php?get=dillo.py' 'dillo.patch')
md5sums=('68a7d4e5dfc7e826a61cf56e656bf8b0'
         '2b23ba82aac8677e3c3163e152be14c6')


build() {
  cd "$srcdir/"
  mv download.php?get=dillo.py dillo.py
  patch -p0 < dillo.patch
  install -Dm644 dillo.py $pkgdir/usr/share/emesene/plugins_base/dillo.py
}

