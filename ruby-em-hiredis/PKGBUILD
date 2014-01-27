# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=em-hiredis
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=2
pkgdesc="Eventmachine redis client"
arch=('any')
url="http://github.com/mloughran/em-hiredis"
license=('MIT')
depends=('ruby' 'ruby-hiredis' 'ruby-em-spec' 'ruby-rspec')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('7234ee9110c31c642a1ca8aad12cec36')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
