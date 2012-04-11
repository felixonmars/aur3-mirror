# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=pd
pkgver=0.43_2
pkgrel=1
pkgdesc="The Pure Data real-time music and multimedia environment"
arch=('i686' 'x86_64')
url="http://crca.ucsd.edu/~msp/software.html"
license=('custom:BSD')
depends=('jack' 'fftw' 'tk')
source=("http://crca.ucsd.edu/~msp/Software/pd-${pkgver/_/-}.src.tar.gz")
md5sums=('72629b9de756b91317965f5e86b61c15')

build() {
  cd "$srcdir/pd-${pkgver/_/-}/src"
  ./configure --prefix=/usr \
              --enable-alsa \
              --enable-jack \
              --enable-fftw
  make
}

package() {
  cd "$srcdir/pd-${pkgver/_/-}/src"
  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 ../LICENSE.txt \
    "$pkgdir/usr/share/licenses/pd/LICENSE"
}
