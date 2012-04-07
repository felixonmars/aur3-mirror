# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=chm-to-pdf
pkgver=0.01
pkgrel=1

arch=('any')
license=('GPLv3')

pkgdesc="A simple Perl script to convert CHM files to PDF (based on wkhtmltopdf)"
url="http://code.google.com/p/trizen/downloads/detail?name=$pkgname-$pkgver.tar.gz"

depends=('perl>=5.10.0' 'perl-text-chm' 'perl-uri' 'wkhtmltopdf-static1')
optdepends=()

source="http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz"
md5sums=('51f15bbd3060fe15adb2877ec2d440c2')

package() {
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
}
