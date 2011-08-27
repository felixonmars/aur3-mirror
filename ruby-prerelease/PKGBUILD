# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_pkgbasename=ruby
pkgver=1.9.2_p0
pkgrel=2
pkgname=$_pkgbasename-prerelease
_pkgbasever=${pkgver/_/-}
pkgdesc="An object-oriented language for quick and easy programming; prerelease version"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.ruby-lang.org/en/"
makedepends=('tk')
depends=('gdbm' 'db' 'openssl' 'zlib' 'readline' 'libffi')
provides=('rubygems' 'rake' "ruby=$pkgver" "ruby-docs=$pkgver")
conflicts=('rubygems' 'rake' 'ruby' 'ruby-docs')
optdepends=('tk: for Ruby/TK')
source=("ftp://ftp.ruby-lang.org/pub/$_pkgbasename/$_pkgbasename-$_pkgbasever.tar.bz2")
options=('!emptydirs')

build() {
  cd "$srcdir/$_pkgbasename-$_pkgbasever"
  ./configure --prefix=/usr --enable-shared --enable-pthread
  make
}

package()
{
  cd "$srcdir/$_pkgbasename-$_pkgbasever"
  make DESTDIR="${pkgdir}" install install-doc
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('4e4906d0aab711286b31f5a834860cc3')
md5sums=('d8a02cadf57d2571cd4250e248ea7e4b')
