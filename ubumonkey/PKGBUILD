# Maintainer: M4rQu1Nh0S (zonadomarquinhos@gmail.com)
# Contributor: Biginoz (biginoz@free.fr)

pkgname=ubumonkey
pkgver=2.1
pkgrel=1
pkgdesc="A lightweight, fast web browser for the modern Linux desktop"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://ubumonkey.sourceforge.net/"
depends=('libgtkhtml')
source=("http://downloads.sourceforge.net/project/ubumonkey/2.1/ubumonkey2.1.deb")

md5sums=('c5cec616a764765e5e7cf1bc738fc3c1')

build() {
echo "unpacking deb"
  ar x ${pkgname}$pkgver.deb;
  cd $startdir/src;
echo "unpacking binary"
  tar xzf data.tar.gz -C $startdir/pkg
}
