_gemname=blather
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="Simpler XMPP built for speed"
arch=('any')
url="http://github.com/sprsquish/blather"
license=('unkown')
depends=('ruby' 'ruby-eventmachine' 'ruby-nokogiri' 'ruby-niceogiri' 'ruby-activesupport' 'ruby-girl_friday')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('ed8c2d822d446c80b0974702ee302f11')
