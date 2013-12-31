# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: oliparcol <oliparcol AT gmail DOT com>

_gemname=directory_watcher
pkgname=ruby-$_gemname-1.4
pkgver=1.4.1
pkgrel=1
pkgdesc="A class for watching files within a directory and generating events when those files change"
arch=('any')
url="http://rubygems.org/gems/directory_watcher"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
provides=("ruby-$_gemname")
conflicts=("ruby-$_gemname")
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('d8e721932dc12c6b566e0fce1c8a5a7b')
sha1sums=('acecc69d216f51c52995edbbbcf28db76264f8b4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
              -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
              $_gemname-$pkgver.gem
}
