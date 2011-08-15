# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=rem-mp3tags
pkgver=20110816
pkgrel=1
pkgdesc="A commandline tool to remove tags of MP3 audio files from a directory and it's subdirectories."
arch=('any')
url="http://code.google.com/p/trizen/downloads/detail?name=$pkgname"
license=('GPL')
depends=('perl-mp3-tag')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('fccc0f8607766bfa9b5f72117b693f9c')

package() {
  install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
