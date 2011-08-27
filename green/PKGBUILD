# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=green
pkgver=0.2
pkgrel=1
pkgdesc="Small and efficient PDF reader."
arch=('i686' 'x86_64')
url="http://wiki.github.com/schandinat/green"
license=('GPLv3')
depends=('poppler-glib' 'sdl')
source=(http://cloud.github.com/downloads/schandinat/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('00f70f2d79e462793959ae96050ea2ad')

build() {
  cd $srcdir/$pkgname-$pkgver

  make
  install -Dm755 green $pkgdir/usr/bin/green
}
