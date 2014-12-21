# Maintainer: Felix E. xelif@icqmail.com

# Upstream name of extension:
_extname=ConfirmAccount
# Variant valid as package name:
_extpkgname=confirmaccount

pkgname=mediawiki-ext-$_extpkgname-git
pkgver=r1480.d7bd12d
pkgrel=2
pkgdesc="A MediaWiki extension for controlled account registration."
install=confirmaccount.install
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
md5sums=("SKIP")
arch=("any")
url="http://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL")
depends=("mediawiki")
makedepends=("git")
provides=("mediawiki-ext-$_extpkgname")
conflicts=("confirmaccount-mediawiki-ext")

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