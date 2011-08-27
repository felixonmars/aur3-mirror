# Maintainer: Mio Iwakura <n dot royer 1 at gmail dot com>
pkgname=rubbinnips
pkgver=1.0.0
pkgrel=1
pkgdesc="A small game in which you rub nipples."
arch=('i686')
url="http://hat.mionet2.com/downloads/"
license=('unknown')
groups=()
depends=(sdl sdl_image sdl_ttf sdl_mixer)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url$pkgname-$pkgver.tar.gz)
noextract=()

build() {
  mkdir -p $pkgdir/usr/
  mkdir -p $pkdir/usr/lib
  mkdir -p $pkgdir/usr/lib/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
  cd ..
  mv ./$pkgname-$pkgver/ $pkgdir/usr/lib/
  chmod +x $pkgdir/usr/lib/$pkgname-$pkgver/run.sh
  ln -s /usr/lib/$pkgname-$pkgver/run.sh $pkgdir/usr/bin/$pkgname
}

md5sums=('0be466c41999512e0b64194efa69f786')
