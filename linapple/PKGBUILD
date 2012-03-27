
# Contributor: Joseph R. Nosie <bolts at archlinux dot us>
pkgname=linapple
pkgver=2a
pkgrel=1
pkgdesc="Linapple is an emulator of Apple][ series computers for Linux or other POSIX-compliant systems."
arch=('i686' 'x86_64')
url="http://linapple.sourceforge.net"
license=('GPL')
depends=('sdl' 'libzip')
install=linapple.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-src_$pkgver.tar.bz2
        unistd.patch
        linapple.sh)
md5sums=('3ca787116bc98e91a9a0999c260c3a04'
         'f7a38720f7758554eb2b79f04afc6aa5'
         'd142c61b6e941bc2d68a2089a2dae503')

build() {
  cd "$srcdir/$pkgname-src_$pkgver/src"
  find .. -type f -exec chmod -x {} \;
  patch -Np2 -i $srcdir/unistd.patch || return 1
  make || return 1

}

package() {
  cd "$srcdir/$pkgname-src_$pkgver/src"
  mkdir -p $pkgdir/usr/share/$pkgname/bin
  mkdir -p $pkgdir/usr/share/$pkgname/config
  mkdir -p $pkgdir/usr/bin
  for file in charset40.bmp font.bmp icon.bmp linapple.conf splash.bmp Master.dsk README
  do
    install -m644 ../$file $pkgdir/usr/share/$pkgname/config/$file
  done
  install -m755 $pkgname $pkgdir/usr/share/$pkgname/bin/$pkgname
  install -m755 $srcdir/linapple.sh $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
