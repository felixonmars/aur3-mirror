# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=pombo
pkgver=0.0.6
pkgrel=3
pkgdesc="A script that can help you recover your computer if it is stolen"
arch=('i686' 'x86_64')
url="http://sebsauvage.net/pombo/"
license=('zlib' 'libpng')
depends=('gnupg' 'python2')
optdepends=(
  'iputils: retrieve information on network neighborhood'
  'pngnq: better compression of screenshots'
  'scrot: take screenshots of your running desktop'
  'xawtv: take a photo using your webcam'
)
backup=('etc/pombo.conf')
source=("http://sebsauvage.net/${pkgname}/${pkgname}_${pkgver}.zip")
md5sums=('414c2d5a964a2770ce9e83fd9b6cd4c6')
sha1sums=('e752dca59338da58794967f1f7d795dd8af791e7')
sha256sums=('bdd888a2662827960ba1419457f2c82fc224d2c6e65b5ad50c724c0f6d9b2a70')
sha384sums=('7ba959a9edd8f1fb120ca21132b7f557efea55009aed64c3ab75b6368e5ec6f55f2f3688754ec94e1ecc2a6fc06dc2a6')
sha512sums=('4c78c92ac520983d6c96c3fea36896e24efdf9cc4c9a1e3937612eef9014410ebdf0b37ce348b4b337f64a9342eee62b1dff8b8a73607428092c576118199d19')

package() {
  cd "$srcdir/${pkgname}_$pkgver"

  msg "Patching pombo..."
  sed 's|/sbin/iwconfig|/usr/sbin/iwconfig|' -i pombo.py

  install -Dm644 pombo.conf $pkgdir/etc/pombo.conf
  install -D pombo.py $pkgdir/usr/bin/pombo

  msg "Configure Pombo by editing /etc/pombo.conf"
  msg "Put $srcdir/${pkgname}_$pkgver/pombo.php4 or $srcdir/${pkgname}_$pkgver/pombo.php5 on your server after changing the password"
  msg "See installation instruction on http://sebsauvage.net/pombo/installation.html"
}
