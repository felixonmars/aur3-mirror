# Maintainer: Czipperz <czipperz@gmail.com>

pkgname=perl6-panda-module-git
pkgver=2014.04
pkgrel=1
pkgdesc="Rakudo Perl 6 Module Management Solution 'Panda'."
arch=('any')
url='https://github.com/tadzik/panda'
license=('PerlArtistic')
depends=('rakudo')
makedepends=('git')
source=('git://github.com/tadzik/panda.git')
md5sums=('SKIP')

package() {
	cd panda
	perl6 bootstrap.pl
}
