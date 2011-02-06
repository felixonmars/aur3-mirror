# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jacksampler
pkgver=0.0.2
pkgrel=1
pkgdesc="A sampler which supports midi input using JACK, and outputs the audio data using JACK."
arch=('i686' 'x86_64')
url="http://space.twc.de/~stefan/jacksampler.php"
license=('LGPL')
depends=('beast' 'jack')
source=("http://space.twc.de/~stefan/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('b72164b845d03df44dc3988272c42a46')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

