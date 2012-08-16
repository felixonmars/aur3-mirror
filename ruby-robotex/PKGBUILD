# Contributor: Nikolay Bogoychev <nheart@gmail.com>

pkgname=ruby-robotex
_realname=robotex
pkgver=1.0.0
pkgrel=1
pkgdesc='With one line of code, Robotex (pronounced like “robotics”) will download and parse the robots.txt file and let you know if your program is allowed to visit a given link.'
arch=("any")
url='https://github.com/chriskite/robotex'
license=("MIT")
depends=("ruby" "ruby-fakeweb>=0.9.5" "ruby-rdoc>=3.12" "ruby-rspec>=2.8.0")
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_realname-$pkgver.gem)
noextract=($_realname-$pkgver.gem)

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_realname-$pkgver.gem
}

md5sums=('e4b4d21c4112243d8ba71806671c5dc8')
