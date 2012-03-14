# Maintainer: snyh <snyh@snyh.org>
pkgname=ruby-ancestry
pkgver=1.2.4
pkgrel=1
pkgdesc="Ancestry allows the records of a ActiveRecord model to be organised in a tree structure, using a single, intuitively formatted database column. It exposes all the standard tree structure relations (ancestors, parent, root, children, siblings, descendants) and all of them can be fetched in a single sql query. Additional features are named_scopes, integrity checking, integrity restoration, arrangement of (sub)tree into hashes and different strategies for dealing with orphaned records."
arch=('any')
url="http://github.com/stefankroes/ancestry"
license=()
groups=()
depends=('ruby' 'ruby-activerecord>=2.2.2')
makedepends=('ruby')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/ancestry-${pkgver}.gem")
noextract=("ancestry-${pkgver}.gem")
md5sums=('d8e42777c0a3a62f29f5eed6c00cd840')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ancestry-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
