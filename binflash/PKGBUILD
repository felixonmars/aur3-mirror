# Contributor: cromo <cromo@klej.net>

pkgname=binflash
pkgver=1.50
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tool for flashing or dumping firmware for (mostly) NEC DVD burners."
url="http://binflash.cdfreaks.com/"
license=("custom")
depends=()
makedepends=('wget')
install=binflash.install
source=("disclaimer.txt")
md5sums=('3d640662d4f286920f37b8b9d3e60e28')

build() {
  mkdir -p $startdir/src
  cd $startdir/src
  wget http://binflash.cdfreaks.com/disclaimer/1/2 http://binflash.cdfreaks.com/download/1/2 || return 1
  rm 2
  tar xzf necflash_linux.tgz || return 1

  install -D -m744 necflash $startdir/pkg/usr/bin/necflash && \
  install -D -m644 disclaimer.txt $startdir/pkg/usr/share/licenses/binflash/disclaimer.txt
}
