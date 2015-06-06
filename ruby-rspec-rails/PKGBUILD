# Contributor: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
pkgname=ruby-rspec-rails
_gemname=rspec-rails
pkgver=3.2.2
pkgrel=1
pkgdesc="RSpec-2 for Rails-3"
arch=(any)
url="http://github.com/rspec/rspec-rails"
license=('MIT')
depends=('ruby' "ruby-rspec-core>=3.2.0" "ruby-rspec-expectations>=3.2.0" "ruby-rspec-mocks>=3.2.0" 'ruby-rspec-support>=3.2.0' 'ruby-railties>=3.0' 'ruby-railties<4.3' 'ruby-actionpack>=3.0' 'ruby-actionpack<4.3' 'ruby-activesupport>=3.0' 'ruby-activesupport<4.3')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('f83a7f34b4b7004acaf0793aac01ae94')

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" "${_gemname}-${pkgver}.gem"
}
