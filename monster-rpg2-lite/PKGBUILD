# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: René Reigel <stormtrooperofdeath@gmx.net>
pkgname=monster-rpg2-lite
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="The Monster series of RPGs are high quality role-playing games. They are built from scratch with a focus on good story, unique gameplay features, and professional looking and sounding artwork and audio."
arch=('i686' 'x86_64')
url="http://www.nooskewl.com"
license=('commercial')
groups=()
depends=('libgl' 'libxinerama' 'libxxf86vm' 'libxfixes')
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
source=(http://www.nooskewl.com/stuff/downloads/MonsterRPG2-lite-1.1.tar.bz2 'monster2')
noextract=()
md5sums=('e4bda2b736e884ac086a45a63a465723' 'b211e8eef420ab461871786115cb8fb3') 
#generate with 'makepkg -g'

build() {
  cd "$srcdir/MonsterRPG2-lite-$pkgver"

  if [ "$CARCH" == "i686" ]; then
		mv 32bit/* ./
  fi
}

package() {
  cd "$srcdir/MonsterRPG2-lite-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -m755 ../monster2 $pkgdir/usr/bin/ 
  install -d -m755 $pkgdir/opt/$pkgname/
  cp -av data libbassflac.so libbass.so LICENSE.txt monster2 README.txt $pkgdir/opt/$pkgname/
 }

# vim:set ts=2 sw=2 et:
