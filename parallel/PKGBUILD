# Maintainer: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=parallel
pkgver=20111222
pkgrel=1
pkgdesc='a shell tool for executing jobs in parallel'
arch=('any')
url='http://www.gnu.org/software/parallel/'
license=('GPL3')
depends=('perl')
conflicts=('moreutils')		# provides a script called 'parallel', too
options=(!makeflags)		# the build fails when run with -j<n> for n>1
source=("http://ftpmirror.gnu.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('cddba502666d4c6658a59060fed854f3')
sha1sums=('6d4896b900f5330f8b4108d6fbec80633da33538')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
