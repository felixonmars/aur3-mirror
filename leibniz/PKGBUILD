# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=leibniz
pkgname=$_gemname
pkgver=0.2.1
pkgrel=1
pkgdesc="Automated Infrastructure Acceptance Testing"
arch=('any')
url="http://leibniz.cc/"
license=('MIT')
depends=(
  'ruby'
  'ruby-test-kitchen>=1.0.0'
  'ruby-kitchen-vagrant>=0'
  'ruby-thor>=0'
  'ruby-cucumber>=0'
)
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('ce9686d2665011906676c6397fd5bb6c')
sha1sums=('0607551ec84b5cb737f69f6b72d5e3dabafa6de5')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
