# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: oliparcol <oliparcol AT gmail DOT com>

_gemname=directory_watcher
pkgname=ruby-$_gemname
pkgver=1.5.1
pkgrel=2
pkgdesc="A class for watching files within a directory and generating events when those files change"
arch=('any')
url="http://rubygems.org/gems/directory_watcher"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('6ac1d35bd46b6963ba4c47d517aeb912')
sha1sums=('312e0f2e724ef2f69a3ecf8dbf0a326fd7ca19fb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
              -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
              $_gemname-$pkgver.gem
}
