# Maintainer: Felix E. xelif@icqmail.com

# Upstream name of extension:
_extname="ParserFunctions"

pkgname=mediawiki-ext-parserfunctions-git
pkgver=r792.082e682
pkgrel=2
pkgdesc="A MediaWiki extension for logic-/string-handling parser enhancements."
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
md5sums=('SKIP')
arch=('any')
url="http://http://www.mediawiki.org/wiki/Extension:$_extname"
license=('GPL')
depends=('mediawiki')
makedepends=('git')
conflicts=()

pkgver() {
  cd $_extname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Target extension directory of MediaWiki:
  _extdir="$pkgdir/usr/share/webapps/mediawiki/extensions"
  mkdir -p "$_extdir"
  rsync -a $_extname "$_extdir/" --exclude .git
}