pkgname=vcprompt
pkgver=1.1
pkgrel=1
pkgdesc='Print a string with info about VCS suitable for inclusion into prompts'
url='https://bitbucket.org/gward/vcprompt'
license='GPLv2'
arch=('i686' 'x86_64' 'armv7h')
source=("$url/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('1780c9fe0277aeeb4821cfcff1f7c8a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR="$pkgdir/usr/share/man/man1"
}
