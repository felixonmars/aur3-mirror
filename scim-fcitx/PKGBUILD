# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: yetist <yetist@gmail.com>
pkgname=scim-fcitx
pkgver=3.1.1
pkgrel=1
pkgdesc="fcitx input on scim"
arch=('i686')
url="http://www.scim-im.org"
license=('GPL')
groups=()
depends=(scim pkgconfig)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://nchc.dl.sourceforge.net/sourceforge/scim/$pkgname.$pkgver.tar.bz2)
noextract=()
md5sums=('781dc96ebce31e2949ecb0c3c1c769f6') #generate with 'makepkg -g'

build() {
  cd "$startdir/src/fcitx"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
