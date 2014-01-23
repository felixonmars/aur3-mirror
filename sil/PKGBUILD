# Maintainer: Michał Walczak <michalwalczak at michalwalczak dot eu>

pkgname=sil
pkgver=1.2.1
pkgrel=2
pkgdesc="A game of adventure set in the first age of Middle-earth, when the world still rang with elven song and gleamed with dwarven mail. Walk the dark halls of Angband. Slay creatures black and fell. Wrest a shining Silmaril from Morgoth’s iron crown."
arch=('i686' 'x86_64')
url="http://www.amirrorclear.net/flowers/game/sil/"
license=('GPL2 custom')
depends=('ncurses' 'libx11')
install=sil.install
source=(http://www.amirrorclear.net/flowers/game/sil/Sil-121-src.zip
        'sil.sh')
md5sums=('5711826cf0977198f87dbc177a3d632a'
         '0e7223f80877fc6aeed7dbbbb9948d52')

build() {
  cd "$srcdir/Sil/src"

  make -f Makefile.std install

  cd ..
}

package() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p $_dest_dir

  cd "$srcdir/Sil"

  install -D -m 755 sil "$_dest_dir"
  cp -r lib "$_dest_dir"
  chown -R :games $_dest_dir
  chmod -R 775 $_dest_dir
  install -T -D -m 755 "$srcdir/sil.sh" "$pkgdir/usr/bin/$pkgname"
}
