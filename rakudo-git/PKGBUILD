#Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=rakudo-git
pkgver=2013.05.15.gcd5ca7c
pkgrel=1
pkgdesc="A Perl 6 compiler for the Parrot virtual machine"
arch=('i686' 'x86_64')
url="http://rakudo.org/"
license=('PerlArtistic')
depends=('parrot' 'nqp')
makedepends=('git' 'perl')
provides=("rakudo")
source=('rakudo::git://github.com/rakudo/rakudo.git')
md5sums=('SKIP')

pkgver() {
  cd rakudo
  git describe --always | sed 's|-|.|g'
}
build() {
  cd rakudo
  perl Configure.pl --prefix=/usr --with-parrot=/usr/bin/parrot --with-nqp=/usr/bin/nqp
  make
}
package() {
  cd rakudo
  make DESTDIR="$pkgdir" install
}
