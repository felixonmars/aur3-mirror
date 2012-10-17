# Maintainer: Francois Garillot <francois[@]garillot.net>
_gemname=github
pkgname=ruby-$_gemname
pkgver=0.7.2
pkgrel=1
pkgdesc="The official github command line helper for simplifying your GitHub experience."
arch=('any')
url="https://github.com/defunkt/github-gem"
license=('MIT')
depends=('ruby' 'ruby-text-hyphen=1.0.0' 'ruby-text-format=1.0.0' 'ruby-highline>=1.6' 'ruby-json_pure>=1.5.1' 'ruby-launchy>=2.0.2')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('e521e3b3b8128cd2c0ecef40812af758')
sha1sums=('87e9cb6ca0c8c48feb608e1dc21710e7c4c97d86')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}
