# Contributor: Enrique Sainz <esbaixauli@gmail.com>

pkgname=metronome
pkgver=1.1
pkgrel=3
pkgdesc="Simple metronome app written in Qt4 and ALSA"
arch=('i686' 'x86_64')
url="http://www.smultron.net/wiki/index.php/Metronome"
license=('GPL')
depends=('qt4' 'alsa-utils')
source=(http://www.smultron.net/project/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname.desktop)
md5sums=('e25132d941022f347e45754f47357755'
         '8e34e63e93f622db6ee7dbd480b67a88')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  qmake-qt4 || return 1
  make || return 1
}

package() {  
  install -D -m755 ${srcdir}/$pkgname-$pkgver/metronome ${pkgdir}/usr/bin/metronome
  install -D -m644 ${startdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
}
