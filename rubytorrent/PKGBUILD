# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=rubytorrent
pkgver=0.071
pkgrel=1
pkgdesc="An easy to use torrent creator for Linux/UNIX (CLI & GUI)"
arch=('i686' 'x86_64')
url="http://benclarke.ca/rubytorrent/"
license=('MIT')
depends=('ruby>=1.8')
optdepends=('ruby-gtk2: for the GUI version')
source=(http://benclarke.ca/rubytorrent/${pkgname}-${pkgver}.tar.gz
		$pkgname.sh)
md5sums=('929a012eb27f88bb40b6d864f30d4668'
         '19cd76a4dea0c1f1629c40b3221d7965')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  install -D -m755 htdocs/scripts/func.js $pkgdir/usr/share/$pkgname/htdocs/scripts/func.js
  cp -r htdocs/css htdocs/images htdocs/index.html $pkgname/usr/share/$pkgname/htdocs/
  install -m644 infohash.rb torrent.rb gtktorrent.rb httptorrent.rb $pkgdir/usr/share/$pkgname
  install -D -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  
}

