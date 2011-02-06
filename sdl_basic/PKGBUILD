# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
pkgname=sdl_basic
pkgver=1.0.2
pkgrel=1
pkgdesc="An implementation of the BASIC language with SDL support"
arch=('i686' 'x86_64')
url="http://www.linuxmotors.com/SDL_basic/"
license=('GPL2')
depends=('sdl')
install=$pkgname.install
source=(http://www.linuxmotors.com/SDL_basic/downloads/SDL_basic-$pkgver.tgz)
md5sums=('3e59b6d38a7d2daf723d6ac782f8d2fa')

build() {
  cd $srcdir/SDL_basic-$pkgver

  make || return 1

  install -m755 -D basic $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname/samples
  install -m644 README $pkgdir/usr/share/$pkgname/
  cp -rf *.bas $pkgdir/usr/share/$pkgname/samples/
}

