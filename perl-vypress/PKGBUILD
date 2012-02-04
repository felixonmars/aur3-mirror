# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=perl-vypress
pkgver=0.71
_tarballname=Net-Vypress-Chat
_internalname=pm-vycchat
pkgrel=1
pkgdesc="It's an perl module for simple use of Vypress Chat protocol."
arch=('i686' 'x86_64')
url="https://developer.berlios.de/projects/pm-vycchat/"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=(http://download2.berlios.de/$_internalname/$_tarballname-$pkgver.tar.gz)
md5sums=('cbab3b748f2edb04c9d771103e6f380a')

build() {
  cd "$startdir/src/$_tarballname"

  perl Makefile.PL || return 1
  make PREFIX=/usr
  make install DESTDIR=$startdir/pkg
  rm -r $startdir/pkg/usr/lib/perl5/core_perl
}

# vim:set ts=2 sw=2 et:
