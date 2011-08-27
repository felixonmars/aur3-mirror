# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=tachyon
pkgver=0.98.9
pkgrel=1
pkgdesc="Multithreaded ray tracing software"
arch=('i686' 'x86_64')
url="http://jedi.ks.uiuc.edu/~johns/raytracer/"
license=('BSD3')
depends=()
source=(http://jedi.ks.uiuc.edu/~johns/raytracer/files/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('eb39e10bb37bccc949b45b8fc28dabd7')

case "$CARCH" in
  "i686") _target=linux-thr ;;
  "x86_64") _target=linux-64-thr ;;
esac

build() {

  cd "$srcdir/$pkgname/unix"
  make $_target
}

package() {
  cd "$srcdir/$pkgname/compile/$_target"
  install -D -m 755 tachyon $pkgdir/usr/bin/tachyon
  install -D -m 644 libtachyon.a $pkgdir/usr/lib/libtachyon.a

  cd "$srcdir/$pkgname/scenes"
  install -d $pkgdir/usr/share/tachyon/scenes/imaps
  install -m 644 README *.dat *.cam *.ac $pkgdir/usr/share/tachyon/scenes
  install -m 644 imaps/* $pkgdir/usr/share/tachyon/scenes/imaps
}

# vim:set ts=2 sw=2 et:
