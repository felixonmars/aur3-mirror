# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-awesome
pkgver=0.0.1
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A noteo module which sends noteo output to an awesome widget, so you can have song changes, libnotify events and more, in your statusbar"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "awesome")
install=noteo-awesome.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('8908cf958ac4313b6912799f63bfd216')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv Awesome $startdir/pkg/usr/share/noteo/
}