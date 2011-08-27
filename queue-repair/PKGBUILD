# Contributor: Alexander Zubkov <green@msu.ru>
pkgname=queue-repair
pkgver=0.9.0
pkgrel=1
pkgdesc="A toolkit for dealing with the qmail queue directory structure"
arch=('i686' 'x86_64')
url="http://pyropus.ca/software/queue-repair/"
license=('GPL2')
depends=('python')
source=("http://pyropus.ca/software/queue-repair/$pkgname-$pkgver.tar.gz")
md5sums=('de68bdb4230fb2754d3ccf718784a66a')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $startdir/pkg/usr/bin
  install -m 755 queue_repair.py $startdir/pkg/usr/bin/queue-repair
}
