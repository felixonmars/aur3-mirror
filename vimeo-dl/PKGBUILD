# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=vimeo-dl
pkgver=0.0.7
pkgrel=1
pkgdesc="A commandline tool to download videos from vimeo.com"
arch=('any')
url="http://i52.tinypic.com/28wj8uw.jpg"
license=('GPL')
depends=('perl-libwww')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('38536477707bf48f0f0ff49b711c1565')

package() {
  install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
