#M: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=libseccomp
pkgver=2.0.0
pkgrel=1
pkgdesc='Enhanced seccomp library'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="http://sourceforge.net/projects/libseccomp/"
depends=('glibc' 'linux>=3.5.0')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f988feac6a3425f2c918f32b28df1caa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
  #GCC="${CC:-gcc}" V=1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install 

  mkdir -m 0755 -p "$pkgdir/usr/share/doc/$pkgname"

  find . -maxdepth 1 -type f | grep -v "[a-z]" | while read somefile; do
    install -v "$somefile" "$pkgdir/usr/share/doc/$pkgname"
  done
}
