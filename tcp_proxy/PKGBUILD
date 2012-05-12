# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tcp_proxy
pkgver=3.0.0
pkgrel=1.2
pkgdesc="A small program for forwarding TCP connections to a remote server"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('libsocklib>=3' 'libgll>=3')
makedepends=('pkgconfig>=0.9')
source=()
_md5sums=('eba8fae4560a13015e4b09ca52eae17c')

build() {
  wget $url/download.php?f=$pkgname.tbz2 --referer=$url -O $pkgname.tbz2
  echo $_md5sums $pkgname.tbz2|md5sum -c -

  tar xvvf $pkgname.tbz2

  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$pkgdir" install
}
