# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=easy-git
pkgver=1.7.3
pkgrel=1
epoch=
pkgdesc="designed to make git easy to learn and use."
arch=('i686' 'x86_64')
url="http://people.gnome.org/~newren/eg/"
license=('GPL')
groups=()
depends=('perl')
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
source=(http://people.gnome.org/~newren/eg/download/1.7.3/eg)
noextract=()


package() {
  cd $srcdir
  install -D -m755 eg $pkgdir/usr/bin/eg
}

md5sums=('cd02e52a24b5edae25b1ae490e182ea3')
