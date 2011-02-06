# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Jesse Young <jesseyoung@gmail.com>

pkgname=ripenc
pkgver=1.2
pkgrel=2
pkgdesc="A CD Ripper and MP3 Encoder written in BASH"
arch=('any')
url="http://meidlinger.org/ripenc/"
license=('GPL')
depends=('mp3info' 'lame' 'cdparanoia')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('5a99b312aadc13fbe82b2789f9b310de')

build() {
  cd $pkgname-$pkgver

  gcc ${CFLAGS} discid.c -o discid || return 1

  mkdir -p $pkgdir/usr/bin
  install -m755 ripenc discid $pkgdir/usr/bin/
}
