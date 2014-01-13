# Maintainer: Zifei Tong <soariez@gmail.com>

pkgname=pkgdiff
pkgver=1.6
pkgrel=1
pkgdesc="A tool for analyzing changes in Linux software packages"
url="http://pkgdiff.github.io/pkgdiff/"
arch=('any')
license=('GPL2')
depends=('perl' 'diffutils' 'gawk')
optdepends=(
  'wdiff: for block diffs'
  'rpm: for analysis of RPM packages'
  'dpkg: for analysis of DEB packages'
  'abi-compliance-checker: for check ABI'
  'abi-dumper: for check ABI'
)
source=("https://github.com/pkgdiff/pkgdiff/archive/${pkgver}.tar.gz")
sha1sums=('9e70b97719e278f347eb63efa61588dcbb4ece65')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl --install --prefix=/usr --destdir="${pkgdir}"
}
