# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=eblook
pkgver=1.6.1
pkgrel=3
pkgdesc="A command-line EPWING dictionary tool."
arch=('i686' 'x86_64')
url="http://openlab.ring.gr.jp/edict/eblook/"
license=('GPL' 'CC0')
depends=('eb-library')
source=(http://openlab.ring.gr.jp/edict/$pkgname/dist/$pkgname-$pkgver.tar.gz
        eb.bash)
md5sums=('c570ce70697e6653d4d086fa3ad97e19'
         'fd70435f5888bdb9b6d80a263dbeb717')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  iconv -f EUCJP eblook.info > eblook.info.utf8
  mv eblook.info.utf8 eblook.info
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 "$srcdir/eb.bash" "$pkgdir/usr/bin/eb"
}
