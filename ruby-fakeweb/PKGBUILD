# Contributor: Nikolay Bogoychev <nheart@gmail.com>

pkgname=ruby-fakeweb
_realname=fakeweb
pkgver=1.3.0
pkgrel=1
pkgdesc='FakeWeb is a helper for faking web requests in Ruby. It works at a global level, without modifying code or writing extensive stubs.'
arch=("any")
url='https://github.com/chrisk/fakeweb/'
license=("MIT")
depends=("ruby" "ruby-mocha>=0.9.5")
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_realname-$pkgver.gem)
noextract=($_realname-$pkgver.gem)

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_realname-$pkgver.gem
}

md5sums=('6417e2bed496a716e6247fa474796426')
