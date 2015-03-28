pkgname=qpopper
pkgver=4.1.0
pkgrel=2
pkgdesc="pop3 daemon"
arch=(i686 x86_64)
url="http://www.eudora.com/products/unsupported/qpopper/index.html"
license=('GPL')
depends=()
options=()
#source=(http://core.ring.gr.jp/archives/net/mail/qpopper/$pkgname$pkgver.tar.gz)
source=(ftp://ftp.qualcomm.com/eudora/servers/unix/popper/qpopper$pkgver.tar.gz)
md5sums=('3b62b70fbcd16bb17795e1762dd33765')

build() {
  cd "$srcdir/$pkgname$pkgver"
  [ -f Makefile ] || ./configure --prefix=/usr
  make
  [ -x mkdir-sh ] || { echo -e '#!/bin/sh\nmkdir -p $1 && chmod $2 $1 && chown $3 $1' >mkdir-sh; chmod ugo+x mkdir-sh; }
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make prefix="$pkgdir/usr" install
}
