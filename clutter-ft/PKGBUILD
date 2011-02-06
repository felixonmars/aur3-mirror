# The name 'clutter' appears to be taken. Damn.

pkgname=clutter-ft
pkgver=0.1.0
pkgrel=1
pkgdesc="simple, download-only file server and associated client"
arch=('i686' 'x86_64')
url="http://phpurity.comze.com/index.php?p=projects#clutter"
license=('GPL')
depends=('python>=2.5.0')
source=("http://phpurity.comze.com/files/clutter/clutter-$pkgver.tar.gz")
md5sums=('9634eb489c2b26793f6cb723b039915c')

build() {
  cd "$srcdir/clutter-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mv clutter clutter.server "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

