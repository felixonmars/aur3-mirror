# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=hyena
pkgver=0.5
pkgrel=1
pkgdesc="A library of useful GUI and non-GUI C sharp code"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Hyena"
license=('GPL')
depends=('mono' 'gnome-sharp')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('9643fadc08e52466a50310adf06abc5e')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
