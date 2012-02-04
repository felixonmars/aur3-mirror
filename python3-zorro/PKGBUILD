pkgname=python3-zorro
pkgver=0.1.3
pkgrel=1
pkgdesc="Networking framework for python, includes redis and zeromq support"
arch=(i686 x86_64)
url="http://github.com/"
license=('LGPL')
depends=(zeromq python python3-greenlet)
makedepends=()
source=("https://github.com/tailhook/zorro/tarball/v$pkgver")
md5sums=('5833db02613a08365c4ebc41e00fab57')
noextract=()

build() {
  rm -rf "$srcdir/zorro"
  mkdir "$srcdir/zorro"
  cd "$srcdir/zorro"
  bsdtar -xf ../v$pkgver --strip-components=1

  #
  # BUILD HERE
  #
  python setup.py build || return 1
  python setup.py install --root="$pkgdir" || return 1
}
