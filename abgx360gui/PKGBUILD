# Contributor: Daniel Spector <dakor1 at gmail dot com>

pkgname=abgx360gui
pkgver=1.0.2
pkgrel=1
pkgdesc="A gtk frontend for abgx360"
arch=('i686' 'x86_64')
url="http://abgx360.net/"
license=('unknown')
depends=('abgx360' 'wxgtk')
source=(http://abgx360.x-scene.com/$pkgname-$pkgver.tar.gz $pkgname.desktop $pkgname.png)
md5sums=('748c34971f3979e073d3279f1832b291'
         '4dde780bb9138a54ff004090c4a3daf5'
         'b604439a431bd6b34b344ec3c9037e3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
install -m 644 $startdir/abgx360gui.desktop $pkgdir/usr/share/applications/
install -m 644 $startdir/abgx360gui.png $pkgdir/usr/share/pixmaps/