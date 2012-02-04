# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=jpgraph
pkgver=3.0.6
pkgrel=1
pkgdesc="An object-oriented graph creating library for PHP"
arch=('any')
url="http://www.aditus.nu/jpgraph/"
license=('custom')
depends=('php' 'gd')
source=(http://hem.bredband.net/jpgraph2/$pkgname-$pkgver.tar.bz2
        QPL PROFESSIONAL)
md5sums=('7af412c576b70b65480c02f7e837fdc8'
         '52db41d899e6f7b19170c17b32a9875c'
         'c67896e4ea6d8d73190d02b7291f8696')

build() {
  cd "$srcdir"
  # install library and docs
  install -d "$pkgdir"/usr/share/{,doc/,licenses/}$pkgname
  cp -r src/* "$pkgdir"/usr/share/$pkgname/
  cp -r docportal/* "$pkgdir"/usr/share/doc/$pkgname/
  # set permissions
  find "$pkgdir"/usr/share/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/$pkgname -type f -exec chmod 644 {} +
  find "$pkgdir"/usr/share/doc/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/doc/$pkgname -type f -exec chmod 644 {} +
  # install licenses
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname ../{QPL,PROFESSIONAL}
}
