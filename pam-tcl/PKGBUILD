# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pam-tcl
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="PAM Extension for TCL"
arch=(any)
url="http://sourceforge.net/projects/tcl-pam/"
license=('GPL')
groups=()
depends=('tcl' 'pam')
makedepends=('tcl' 'pam')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/tcl-pam/tcl-pam/1.1/tcl-pam-$pkgver.tar.gz)
noextract=()
md5sums=('093aebd5982a267b4e9ce97b8984ce44')

build() {
  cd "$srcdir/tcl-pam-$pkgver"
  autoconf
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/tcl-pam-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
