# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=resdup
pkgver=0.0.4
pkgrel=1
pkgdesc="A commandline tool to remove duplicated lines from a file, with many sort options."
arch=('any')
url="http://code.google.com/p/trizen/downloads/detail?name=$pkgname-$pkgver.tar.gz"
license=('GPL')
depends=('perl')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('9aadc206ceebb071dec16e7c24c6d89f')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
