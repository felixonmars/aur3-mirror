# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=songwrite2
pkgver=0.4
pkgrel=3
pkgdesc="Tablature editor in Python/GTK2"
arch=(i686 x86_64)
url="http://home.gna.org/oomadness/en/songwrite/index.html"
license=('GPL')
depends=('editobj2' 'gtk2' 'cairo' 'pango' 'python2')
makedepends=()
conflicts=(songwrite)
replaces=(songwrite)
backup=()
install=
source=(http://download.gna.org/songwrite/Songwrite2-$pkgver.tar.gz)
md5sums=('f0cc1bfb5428ec20271968ff7bceb1db')

build() {
  cd $startdir/src/Songwrite2-$pkgver
  python2 setup.py bdist
}

package() {

  tar xvfz $startdir/src/Songwrite2-$pkgver/dist/Songwrite2-$pkgver.linux-`uname -m`.tar.gz -C $startdir/pkg/songwrite2
 
  
  mkdir -p $pkgdir/usr/share/pixmaps
  cp $srcdir/Songwrite2-$pkgver/data/songwrite2_64x64.png $pkgdir/usr/share/pixmaps/songwrite.png
	
  install -D -m644 $srcdir/../songwrite.desktop $pkgdir/usr/share/applications/songwrite.desktop
}
