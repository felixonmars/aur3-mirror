# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
_basename=rakudo
pkgname=$_basename-moarvm
pkgver=2015.02
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=("nqp-moarvm>=$pkgver")
makedepends=('perl>=5.8')
options=('!makeflags')
source=(http://rakudo.org/downloads/$_basename/$_basename-$pkgver.tar.gz)
sha512sums=('c6acf3704f820f523be4b0bd2dba9cee23a573364bd22f8a5b8f65b3a0fdc2dcd2921a89ff1e3499d372af611a9fcc2d5660952f3b5d9efee4849ed0b14979e8')

build() {
  cd "$_basename-$pkgver"
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd "$_basename-$pkgver"

  make DESTDIR="$pkgdir" install
}
