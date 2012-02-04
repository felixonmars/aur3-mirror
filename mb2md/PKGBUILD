# Contributor: Giorgio Lando <patroclo7@gmail.com>
pkgname=mb2md
pkgver=3.20
pkgrel=3
pkgdesc="A perl script that takes one or more mbox mailboxes and convert them in maildir mailboxes"
url="http://batleth.sapienti-sat.org/projects/mb2md/"
depends=(perl-timedate)
license=(GPL)
arch=('i686' 'x86_64')
source=(http://batleth.sapienti-sat.org/projects/$pkgname/$pkgname-$pkgver.pl.gz)
md5sums=('b47eaa6ae4231a42f4a15564a08eb439')

build() {
  cd $startdir/src 
  install -D -m755 $pkgname-$pkgver.pl $startdir/pkg/usr/bin/mb2md.pl
}
