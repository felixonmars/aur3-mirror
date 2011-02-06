pkgname=x60br
pkgver=0.1
pkgrel=1
pkgdesc="xep-60 browser"
arch=(any)
url="http://x60br.berlios.de/"
license=('GPL')
depends=(twisted pygtk libglade)
source=(http://download2.berlios.de/x60br/x60br-$pkgver.tar.gz)
md5sums=('0f6a235eb93e653e95d3633cc9a03c38')

build() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/{share,bin}
  cp -r x60br-$pkgver $pkgdir/usr/share/x60br || return 1
  sed -i 's#python src/pubsub/browser/main.py#exec python src/pubsub/browser/main.py#' $pkgdir/usr/share/x60br/run.sh
  echo -e '#!/bin/sh\ncd /usr/share/x60br && exec ./run.sh' >$pkgdir/usr/bin/x60br
  chmod 0755 $pkgdir/usr/bin/x60br
}
