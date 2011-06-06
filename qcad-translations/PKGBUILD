# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <fsmail@kondorgulasch.de>
pkgname=qcad-translations
pkgver=2
pkgrel=1
pkgdesc="Translations for QCad extracted from Ubuntus qcad-data package"
arch=('any')
url="http://www.ribbonsoft.com/qcad.html"
license=('GPL')
groups=()
depends=(qcad)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(data.tar.gz)
noextract=()
md5sums=(5c8e6eaa2617c0df84bba6d7b8bd5f58) #generate with 'makepkg -g'

build() {
  cd "$srcdir/"

}

package() {
  cd "$srcdir/"
  cp -R ./usr $pkgdir
}
