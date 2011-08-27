# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libwab
pkgver=060901
pkgrel=1
pkgdesc="A little command line utility that you can use to export your addresses from a Windows Address Book (used in Microsoft Outlook Express) to a ldif file"
arch=('i686' 'x86_64')
url="http://lilith.tec-man.com/libwab/"
license=('GPL')
groups=()
depends=(glibc)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=(http://lilith.tec-man.com/libwab/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(82c333cb5f737a100c9a431d920dbd5f) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
