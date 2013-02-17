# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=i4uc
pkgver=0.7.3
pkgrel=1
pkgdesc="IDE for microcontrollers"
arch=('i686' 'x86_64')
url="http://i4uc.sourceforge.net/"
license=('GPLv3')
depends=('gtksourceview2' 'libgee' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'make')
optdepends=('sdcc' 'picp' 'pk2cmd' 'arm-eabi-gcc' 'lpc21isp' 'gcc-avr' 'gcc-msp430' 'srecord' 'avrdude' 'jalv2' cpik)
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/0.7/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('832ad025bc42e91d4b86d44fcc2891002fc5fa9b482d3b3cecb2bfe2d779d79d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
