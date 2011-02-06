# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=pepper
pkgver=0.2
pkgrel=1
pkgdesc="Network sniffer detector"
url="http://codemore.org/pepper.html"
license=('BSD')
source=(http://codemore.org/files/pepper/$pkgname-$pkgver.tgz)
md5sums=('e4979d009608e4a75a82153608fb54d4')
sha1sums=('0c41abe317eb935a5199fc8053fc62f41ad92f51')
arch=('i686')
depends=('libnet' 'libpcap')

build() {
  cd $startdir/src/$pkgname-$pkgver

  make || return 1

  mkdir -p $startdir/pkg/usr/bin
  make prefix=$startdir/pkg/usr install || return 1

  mkdir -p $startdir/pkg/usr/share/licenses/pepper
  cp LICENSE $startdir/pkg/usr/share/licenses/pepper
}
