# Contributor: wang feng  <wang_feng[at]live[dot]com>

_gemname=vmail
pkgname=ruby-$_gemname 
pkgver=2.6.2
pkgrel=1
pkgdesc="A Vim interface to Gmail"
arch=('any')
url="http://danielchoi.com/software/vmail.html"
license=('MIT')
depends=('ruby' 'ruby-mail' 'ruby-highline' 'ruby-sequel' 'ruby-sqlite3')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('c28d3794bfc441465ad77d92c6f4243d')

