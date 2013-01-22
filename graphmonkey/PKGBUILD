# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Will Price <willprice94+aur@gmail.com>
pkgname=graphmonkey
pkgver=1.7
pkgrel=1
epoch=
pkgdesc="A GTK-based graphing calculator"
arch=('i686' 'x86_64')
url="http://graphmonkey.sourceforge.net/"
license=('GPL')
groups=()
depends=('mono' 'gtk-sharp-2')
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
source=("downloads.sourceforge.net/project/graphmonkey/GraphMonkey/GraphMonkey-1.7/GraphMonkey-1.7.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fgraphmonkey%2Ffiles%2FGraphMonkey%2FGraphMonkey-1.7%2F&ts=1358609737")
noextract=()
md5sums=() #generate with 'makepkg -g'

package() {
  cd "$srcdir/GraphMonkey-$pkgver"

  mkdir -p "$pkgdir"/usr/share/{graphmonkey,doc/graphmonkey}
  mkdir -p "$pkgdir"/usr/bin

  cp HELP "$pkgdir"/usr/share/doc/graphmonkey/help
  cp "GraphMonkey.exe" "$pkgdir/usr/share/graphmonkey/"

  echo "mono /usr/share/graphmonkey/GraphMonkey.exe" > "$pkgdir/usr/bin/graphmonkey"
  chmod +x "$pkgdir/usr/bin/graphmonkey"
}



# vim:set ts=2 sw=2 et:
md5sums=('86397f2968bbe6c83c38e8d1b7948cae')
