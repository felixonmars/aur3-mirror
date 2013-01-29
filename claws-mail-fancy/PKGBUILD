# Maintainer: Mnichal <mnichal[at]jzb[d]waw[d]pl>

pkgname=claws-mail-fancy
pkgver=0.9.17
pkgrel=1
pkgdesc="Claws-Mail plugin for HTML mail rendering"
url="http://www.claws-mail.org/plugins.php"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('claws-mail>=3.9.0' 'libwebkit' 'libsoup-gnome>=2.26' 'curl' 'glib2>=2.6' 'gtk2>=2.6')
source=("http://www.claws-mail.org/downloads/plugins/fancy-${pkgver}.tar.gz")
md5sums=('0848b0cbf3a82defc217907966d98a86')
 
build() {
  cd "${srcdir}/fancy-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/fancy-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}