# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mauro Andreolini <mauro.andreolini@unimore.it>
pkgname=sqlscan
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="SQL scanner through Google queries"
arch=('any')
url="http://www.question-defense.com/2012/12/19/sqlscan-backtrack-5-information-gathering-web-application-analysis-web-crawlers-sqlscan"
license=('custom')
groups=()
depends=(python2)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://archives.devilzc0de.org/others/darkc0de.com/scanners/sqlscan.py")
noextract=()
md5sums=('5068c4c5f84c94f36f689a6f0b8f24e1')

build() {
  cd "${srcdir}"
  sed -i -e "s|/python|/python2|" -e "s///" sqlscan.py
}

package() {

  cd "${srcdir}"
  install -D -m 755 sqlscan.py "${pkgdir}/usr/bin/sqlscan.py"
}

# vim:set ts=2 sw=2 et:
