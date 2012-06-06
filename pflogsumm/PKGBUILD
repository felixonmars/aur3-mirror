# Contributor: Mark Rosenstand <mark@borkware.net>
# Maintainer: Jeff Anderson <jefferya@programmerq.net>
pkgname=pflogsumm
pkgver=1.1.3
pkgrel=1
pkgdesc="Postfix Log Entry Summarizer"
url="http://jimsun.linxnet.com/postfix_contrib.html"
license="GPL"
arch=('i686' 'x86_64')
depends=('perl-date-calc')
source=(http://jimsun.linxnet.com/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('5e3fb28dfb5b7f4a8b6b9bf2abde9542')

build() {
  cd $startdir/src/$pkgname-$pkgver

  install -D -m755 pflogsumm.pl $startdir/pkg/usr/bin/pflogsumm
  install -D -m644 pflogsumm.1 $startdir/pkg/usr/man/man1/pflogsumm.1
}
