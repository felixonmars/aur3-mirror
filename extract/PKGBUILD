# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=extract
pkgver=0.2.4.0
pkgrel=4
pkgdesc="Script to extract multiple archives"
arch=(any)
url="http://bluewind.at"
license=('WTFPLv2')
depends=('gzip' 'tar' 'p7zip' 'unrar' 'unzip' 'bzip2' 'file' 'xz')
conflicts=(csound)
source=("http://bluewind.at/stuff/mirror/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b78eea927daa99d48085c0d99e6d78fc')
sha256sums=('302374f5a4fd87c3a509ce2c7abed682a61a26fe9074d3bb630800dfa6359052')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  cd ${pkgdir}/usr/bin
  ln -s ${pkgname} x
}

# vim:set ts=2 sw=2 et:
