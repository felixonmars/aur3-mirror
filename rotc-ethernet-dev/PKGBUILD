# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=rotc-ethernet-dev
_pkgname_or=rotc-ethernet
pkgver=LATEST
pkgrel=1
pkgdesc="Revenge Of The Cats: Ethernet - A free, independent multiplayer FPS computer game."
arch=('i686' 'x86_64')
url="http://ethernet.wasted.ch/"
license=('custom')
[ "$CARCH" = "i686" ] && depends=('libgl' 'sdl' 'libtheora' 'libxft')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libgl' 'lib32-sdl' 'lib32-libtheora' 'lib32-libxft')
install=$_pkgname_or.install
provides=$_pkgname_or
conflicts=$_pkgname_or
source=($_pkgname_or.desktop $_pkgname_or.png $_pkgname_or)
md5sums=('72a3e5440719de46b583a4caa055619e' '1ee90556779891fe9911729fbadc119c'\
         'df7b4213992b575a5e8ea87af571176c')

build() {
  wget --no-cache -c http://dev.ethernet.wasted.ch/HEAD.zip -O $SRCDEST/HEAD.zip || return 1
  ln -fs $SRCDEST/HEAD.zip $srcdir/HEAD.zip

  echo "Extracting game..."
  unzip -oq $srcdir/HEAD.zip -d $srcdir/$pkgname-$pkgver || return 1
  find $srcdir/$pkgname-$pkgver -iregex '.*\.\(exe\|dll\)' -exec rm {} + || return 1

  install -d $pkgdir/usr/share/$_pkgname_or $pkgdir/usr/bin

  cp -a $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/$_pkgname_or/
  install -m755 $srcdir/$_pkgname_or $pkgdir/usr/bin/

  install -d $pkgdir/usr/share/applications/
  install -m644 $startdir/src/$_pkgname_or.desktop $pkgdir/usr/share/applications/

  install -d $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/$_pkgname_or.png $pkgdir/usr/share/pixmaps/
}
