# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=youtube-downloader
pkgver=1.9.1
pkgrel=1
pkgdesc="A commandline tool to search and download YouTube videos at any available resolution."
arch=('any')
url="http://trizen.go.ro/"
license=('GPL')
depends=('perl-libwww')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('f7372537806f78c097370548eba3e365')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
