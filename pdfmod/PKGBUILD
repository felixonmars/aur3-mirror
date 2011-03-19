# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=pdfmod
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple tool for modifying PDF documents"
arch=('i686' 'x86_64')
url="http://live.gnome.org/PdfMod"
license=('GPL2')
depends=('mono' 'gnome-doc-utils' 'hyena>=0.3')
makedepends=('pkgconfig' 'intltool>=0.35.0')
install=$pkgname.install
source=(http://download.gnome.org/sources/$pkgname/0.9/$pkgname-$pkgver.tar.bz2
        0001-Force-use-of-the-overloaded-implicit-operator-of-Hye.patch)
md5sums=('62c7ba085c0cf353fbfea910df9d4270'
         '62f00bcd2e8bfc8a14e00500731e360f')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 -i ../0001-Force-use-of-the-overloaded-implicit-operator-of-Hye.patch
  
  ./configure --prefix=/usr
  
  #libpoppler-glib fix
  sed -i 's/libpoppler-glib\.so\.4/libpoppler-glib\.so/g' \
    lib/poppler-sharp/poppler-sharp/poppler-sharp.dll.config
  
  make || return 1
  make DESTDIR="$pkgdir/" install
}
