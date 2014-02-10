# Maintainer: burntcookie90

pkgname=rename-perl-git
pkgver=v1.600.r9.gde42ae1
pkgrel=2
pkgdesc="This program renames files according to modification rules specified on the command line. If no filenames are given on the command line, a list of filenames will be expected on standard input."
license=('GPL')
url="http://plasmasturm.org/code/rename/"
arch=('i686' 'x86_64')
depends=('perl')
makedepends=('git')
source=("$pkgname"::'git://github.com/ap/rename.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}/"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	install -D -m 755 ${srcdir}/${pkgname}/rename ${pkgdir}/usr/bin/rename-perl
}
