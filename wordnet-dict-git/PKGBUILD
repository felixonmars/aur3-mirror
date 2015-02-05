# Maintainer: Todd Partridge <https://github.com/Gen2ly/archpkgs>

pkgname=wordnet-dict-git
_pkgname=${pkgname%-*}
pkgver=1.0.0
pkgrel=1
pkgdesc="Scripts that parse the output of WordNet to provide basic, command line, versions of a dictionary and thesaurus."
arch=("any")
url="https://github.com/Gen2ly/"$_pkgname"/"
license=("GPL2")
depends=("wordnet")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/Gen2ly/"$_pkgname"")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 dict        "$pkgdir"/usr/bin/dict
  install -Dm755 thes        "$pkgdir"/usr/bin/thes
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
