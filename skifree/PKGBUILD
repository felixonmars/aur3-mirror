# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=skifree
pkgver=20120327
pkgrel=2
pkgdesc="SKIFREE from some windows 90 something (wine)"
arch=('any')
url="http://www.moddb.com/games/skifree"
license=('GPL')
depends=('wine')
provides=(skifree)
source=(http://media1.gamefront.com/moddb/2008/09/17/ski32.zip?b17f4b620c6cf1393ffa644d1ceea1519471f50243241c9c351f544aefaeb617054856f45e07ae230795c14b30a53906a278cc670925e173f731b5fd32bd218fb90845949619807a84ff7c23736658ee3294cb538e310a7a2413f5fe82ed645413171cad3c5a185c38f5b0b7451c4a726e92
        skifree.sh)

package() {
  cd "$srcdir"
  install -Dm644 ski32.exe "$pkgdir/usr/share/$pkgname/$pkgname.exe"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
md5sums=('69c72f7e0c4fc99b40d0282a4f2b884e'
         'b8061f48782371cddcebbc7ffbc4e845')
