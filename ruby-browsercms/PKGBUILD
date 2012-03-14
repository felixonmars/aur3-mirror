# Maintainer: snyh<snyh@snyh.org>
pkgname=ruby-browsercms
pkgver=3.3.3
pkgrel=1
pkgdesc="BrowserCMS is a a general purpose, open source Web Content Management System (CMS), written using Ruby on Rails."
arch=('any')
url="https://github.com/browsermedia/browsercms"
license=('custom')
groups=()
depends=('ruby' 'ruby-rails' 'ruby-ancestry' 'ruby-term-ansicolor')
makedepends=('ruby')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/browsercms-${pkgver}.gem")
noextract=("browsercms-${pkgver}.gem")
md5sums=("930c9f6c7d36fdf4e950d18bbd783837")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" browsercms-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
