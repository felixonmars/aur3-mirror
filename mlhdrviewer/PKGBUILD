# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=mlhdrviewer
pkgver=0.1.0
pkgrel=4
pkgdesc="Simple image viewer specially designed for viewing high dynamic range images"
arch=('i686' 'x86_64')
url="http://www.moonlight3d.eu/"
license=('GPL2')
depends=('java-runtime' 'libgl')
source=(http://www.moonlight3d.eu/downloads/mlhdrviewer-$pkgver-Linux-$CARCH.tar.bz2 \
        mlhdrviewer.sh mlhdrviewer.desktop)
if [ $CARCH = "i686" ]; then
  md5sums=('451ec15c66b875e9b0955394620c00a1'
           '3046c6a55f1b04d71ec6b3722a4d9248'
           '1166bb09ea39fb704609ae604bd50b08')
elif [ $CARCH = "x86_64" ]; then
  md5sums=('f82a7876676ee0d04a9e7eed6401de2b'
           '3046c6a55f1b04d71ec6b3722a4d9248'
           '1166bb09ea39fb704609ae604bd50b08')
fi

package() {
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/bin"

  cp -a "$srcdir/mlhdrviewer-$pkgver-Linux-$CARCH" "$pkgdir/opt/$pkgname"

  install -D -m755 "$srcdir"/mlhdrviewer.sh "$pkgdir"/usr/bin/mlhdrviewer
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
