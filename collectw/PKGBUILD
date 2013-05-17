# Maintainer: Ilya Makarov <zveroy [at] gmail [dot] com>
pkgname=collectw
pkgver=0.0.4b
pkgrel=2
pkgdesc='Collectw is web-based UI for collectd.'
url='http://sourceforge.net/projects/collectw/'
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('rrdtool' 'fcgi')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/collectw_${pkgver}.tar.gz"
    'collectw.service'
    'collectw.install')
md5sums=('11d77b1313a62ce1bce07559b5e4e2dc'
    'e5f5beb605a21abc81b07cae17bf0e8a'
    '562330f631bfd455e93b3779eaf6a179')
install='collectw.install'

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  # fix Makefile
  sed -i -r 's;=\$\(wildcard ([^)]+)\);=$(sort $(wildcard \1));' Makefile
  make
}

package() {
  install -Dm644 collectw.service "$pkgdir/usr/lib/systemd/system/collectw.service"

  cd "${srcdir}/${pkgname}"
  install -m 755 collectw -D ${pkgdir}/usr/bin/collectw
  install -m 755 -d ${pkgdir}/usr/share/collectw
  install -m 644 index.html script.js style.css icon.png ${pkgdir}/usr/share/collectw
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 collectw.nginx ${pkgdir}/etc/nginx/collectw.conf
}

# vim:set ts=2 sw=2 et:
