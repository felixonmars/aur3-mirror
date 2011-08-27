# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-gmailcheck
pkgver=0.0.3
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Module for noteo which can query a gmail account"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "wget" "pygtk")
install=noteo-gmailcheck.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('67f4c2ba879d234422d2512ce4d29ad5')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv GmailCheck $startdir/pkg/usr/share/noteo/
}