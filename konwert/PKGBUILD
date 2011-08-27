# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=konwert
pkgver=1.8.11.2
pkgrel=1
pkgdesc="Converts text between multifarious charsets"
arch=("i686" "x86_64")
url="https://launchpad.net/ubuntu/+source/konwert"
license=("GPL")
depends=("bash" "perl")
makedepends=()
source=("https://launchpad.net/ubuntu/jaunty/+source/konwert/1.8-11.2/+files/konwert_1.8.orig.tar.gz"
        "https://launchpad.net/ubuntu/jaunty/+source/konwert/1.8-11.2/+files/konwert_1.8-11.2.diff.gz")
md5sums=('838e73ec911ebf25816135cbfd0f7a04' '62067a2db81acf6d6b2f78a30ee015f0')

build() {
  cd $srcdir/$pkgname-1.8
  patch -Np1 -i ../konwert_1.8-11.2.diff || return 1
  make prefix=/usr || return 1
  make prefix=$pkgdir/usr install || return 1
  cd $pkgdir/usr
  install -d share
  mv doc man share
}
