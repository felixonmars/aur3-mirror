# Maintainer: Marco Scarpetta <marcoscarpetta@mailoo.org>
pkgname=spiceopus-bin
pkgver=2.3
pkgrel=1
pkgdesc="General purpose circuit simulator"
url="http://www.spiceopus.si/"
arch=('x86_64' 'i686')
license=('custom')
depends=('libpng12')

if [[ "$CARCH" == "i686" ]]; then
  source=("http://fides.fe.uni-lj.si/spice/download/spice_opus23_linux.tar.gz"
          "LICENSE")
  md5sums=('b4445e0bc5b812203796ee8abdac2894'
           'bcdd44d6d17302711c8ff0abe666a601')

else
  source=("http://fides.fe.uni-lj.si/spice/download/spice_opus23_linux_amd64.tar.gz"
          "LICENSE")
  md5sums=('b5fa381ab1f03681adf9b92a356ac974'
           'bcdd44d6d17302711c8ff0abe666a601')
fi

package() {
  if [[ "$CARCH" == "i686" ]]; then
    cd "$srcdir/spice_opus23_linux_18.Jan.2010_08.57"
  else
    cd "$srcdir/spice_opus23_linux_amd64_18.Jan.2010_08.47"
  fi
  mkdir "$pkgdir/usr"
  ./install "$pkgdir/usr"
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
