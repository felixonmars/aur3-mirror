# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
_basename=nqp
pkgname=$_basename-moarvm
pkgver=2015.02
pkgrel=1
pkgdesc="High-level environment to create compilers and libraries for virtual machines (MoarVM backend)"
arch=('any')
url='https://github.com/perl6/nqp#readme'
license=(PerlArtistic)
depends=('bash' "moarvm>=$pkgver")
makedepends=('perl>=5.8')
options=('!makeflags')
source=(http://rakudo.org/downloads/$_basename/$_basename-$pkgver.tar.gz)
sha512sums=('b5f2f17044c2de2996c05fa244e0a3286f88b9834f71cd9eda62f7ae133f625aa26220e464659ea4133fa0c5f9302d606bee765a139b37ba26bb2d4ef7035df0')

build() {
    cd "$_basename-$pkgver"

    perl Configure.pl --backends=moar --prefix=/usr
    make
}

package() {
    cd "$_basename-$pkgver"
    make DESTDIR="$pkgdir/" install
}
