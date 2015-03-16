# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Daniel Sage <daniel@ceri.co>

pkgname=osslsigncode
pkgver=1.7.1
pkgrel=1
pkgdesc="Platform-independent tool for Authenticode signing of PE(EXE/SYS/DLL/etc), CAB and MSI files"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/osslsigncode"
license=("GPL")
depends=("curl" "openssl")
source=("http://downloads.sourceforge.net/sourceforge/osslsigncode/$pkgname-$pkgver.tar.gz")
md5sums=("ac5655b9281b692423ecb2e9185f09d7")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
