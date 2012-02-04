# Maintainer: Duong Pham <dthpham@gmail.com>
pkgname=tesjeract
pkgver=0.3.2
pkgrel=1
pkgdesc="A Java JNI wrapper for the Tesseract OCR engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tesjeract/"
license=('Apache')
depends=('tesseract=2.04')
makedepends=('java-environment' 'apache-ant')
source=(http://tesjeract.googlecode.com/files/$pkgname-$pkgver-src.zip)
md5sums=('e825e0cabae85f1c872561a3c49a491a')

build() {
  cd "$srcdir/$pkgname-$pkgver/java"
  ant || return 1

  cd "$srcdir/$pkgname-$pkgver/native/unix"
  ./configure \
    JDK_HOME=/opt/java \
    --with-tesseract-lib-dir=/usr/lib/tesseract \
    --with-tesseract-include-dir=/usr/include/tesseract \
    --prefix=/usr

  msg "Starting make..."
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/java/build/jar"  
  install -m755 -d "$pkgdir/usr/share/java/$pkgname"
  install -m644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname"

  cd "$srcdir/$pkgname-$pkgver/native/unix"
  make DESTDIR="$pkgdir" install
}
