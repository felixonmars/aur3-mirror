pkgname=0trace
pkgver=20070125
pkgrel=1
pkgdesc='A hop enumeration tool'
url='http://jon.oberheide.org/0trace/'
arch=('any')
license=('GPL3')
depends=('libdnet' 'python2-dpkt' 'python2-pypcap')
source=('https://jon.oberheide.org/0trace/downloads/0trace.py')
md5sums=('15a33fca56731af49e61001e38689c63')

DLAGENTS=('https::/usr/bin/curl -kfLC - --retry 3 --retry-delay 3 -o %o %u')

prepare() {
  cd $srcdir
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python2|" 0trace.py
}

package() {
  cd $srcdir
  install -Dm755 0trace.py $pkgdir/usr/bin/0trace
}
