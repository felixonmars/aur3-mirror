# Contributor: Simon Schneider <schneida dot simon at gmail dot com>
pkgname=ctronome
pkgver=0.5.3
pkgrel=2
pkgdesc="A simple metronome for the commandline"
arch=('i686' 'x86_64')
url="http://ctronome.kign.org/"
license=('GPL2')
source=("http://ctronome.kign.org/source/$pkgname-$pkgver.tar.gz")
md5sums=('12b46a7825ea5156100ac1f0bcd148ab')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  install -d "$pkgdir/usr/share/$pkgname/"
  install -d "$pkgdir/usr/bin/"
  cp *.wav "$pkgdir/usr/share/$pkgname/"
  install -Dm755 $pkgname "$pkgdir/usr/bin/"
  
}

# vim:set ts=2 sw=2 et:
