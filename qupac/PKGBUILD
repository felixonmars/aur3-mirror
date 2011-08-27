# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=qupac
pkgver=0.1.3
pkgrel=1
pkgdesc="Qt4 frontend for tupac. Features: search as you type, install/remove queue, pre-download in order to view install scripts content before installing. MOCKUP RELEASE: ONLY INSTALL FUNCTIONAL"
arch=()
url="http://lapacaloca.com/arch"
license=('GPL')
groups=()
depends=('pyqt>=4.0', 'tupac>=0.5.1' 'python-pexpect=>2.3')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://lapacaloca.com/arch/$pkgname-$pkgver.tar.gz)
noextract=()
arch=('i686' 'x86_64')
md5sums=('256fe090412d6a09624030c8c21391c0')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  mkdir -p $startdir/pkg/usr/lib/qupac

  cp * $startdir/pkg/usr/lib/qupac

  mkdir -p $startdir/pkg/usr/bin

  ln -s /usr/lib/qupac/qupac.py $startdir/pkg/usr/bin/qupac

}

# vim:set ts=2 sw=2 et:
