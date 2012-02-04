# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=magicseteditor-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="A program to help create Magic: the Gathering cards and sets. 32 bit binary release"
arch=(i686)
url="http://magicseteditor.sourceforge.net"
license=('GPL')
depends=(wxgtk hunspell)
conflicts=(magicseteditor)
provides=("magicseteditor=$pkgver")
source=(http://downloads.sourceforge.net/magicseteditor/mse-$pkgver-linux.tar.gz)
md5sums=('f92d3a04a65e30f35a812cffeda32638')

build() {
  cd "$srcdir/magicseteditor/program"

  install -Dm755 magicseteditor $pkgdir/usr/bin/magicseteditor
  install -d $pkgdir/usr/share/magicseteditor/
  cp -r data resource $pkgdir/usr/share/magicseteditor/
  find $pkgdir/usr/share/magicseteditor -type d -exec chmod 755 {} +
  find $pkgdir/usr/share/magicseteditor -type f -exec chmod 644 {} +
}

# vim:set ts=2 sw=2 et:
