# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
pkgname=perltidy
pkgver=20090616
pkgrel=1
pkgdesc="Perl script which indents and reformats Perl scripts to make them easier to read."
arch=('any')
url="http://perltidy.sourceforge.net/"
license=('GPL')
depends=('perl')
makedepends=('perl')
source=("http://downloads.sourceforge.net/$pkgname/Perl-Tidy-$pkgver.tar.gz")
md5sums=('63baa94a96fc5c272e06e72e589e7673')

build() {
  msg "Nothing to compile for $pkgname"
}

package() {
  cd "$srcdir/Perl-Tidy-$pkgver"
  
  perl pm2pl
  
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
  
  # Install Documentation
  mkdir -p $pkgdir/usr/share/doc/perltidy-20090616/ || return 1
  cp -R docs/* $pkgdir/usr/share/doc/perltidy-20090616/ || return 1
  chmod 444 $pkgdir/usr/share/doc/perltidy-20090616/* || return 1
}

# vim:set ts=2 sw=2 et:
