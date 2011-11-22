# Maintainer: Samuel Tardieu <sam@rfc1149.net>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>
pkgname=guilt
pkgver=0.35
pkgrel=1
pkgdesc="Patch management tool for git, closer to the spirit of Quilt than StGIT."
arch=('any')
url="http://www.kernel.org/pub/linux/kernel/people/jsipek/guilt/"
license=('GPL')
makedepends=('asciidoc' 'xmlto')
depends=('git')
install=
source=(http://ftp.sunet.se/pub/Linux/kernels/people/jsipek/guilt/$pkgname-$pkgver.tar.gz)
md5sums=('d8b29202c69e11c0b4266954e06146a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install || return 1
  make doc || return 1
  make DESTDIR="$pkgdir" PREFIX="/usr" mandir="/usr/share/man" install-doc || return 1
}

# vim:set ts=2 sw=2 et:
