# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=jack_delay
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line tool to measure JACK audio server latency"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('jack')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('8f61ecf5bc0744bf943c6ad993177a31')

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"

  # bin
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"
}
