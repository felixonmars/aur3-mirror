# Maintainer: Maarten Verwijs <contact@maartenverwijs.nl>

pkgname=ruby-redmine-client
pkgver=0.0.1
pkgrel=2
pkgdesc="Redmine API Client. Rubygem to access the Redmine API. Based on the documentation from www.redmine.org/wiki/redmine/Rest_api_with_ruby"
arch=('any')
url="https://github.com/edavis10/redmine_client"
license=('custom')
depends=('ruby')
source=(http://rubygems.org/downloads/redmine_client-${pkgver}.gem
        COPYING)
md5sums=('f235ee7f1e320eeeb813b9ab9cf7ce72'
         'e5b00af8dec79c36d7bb005a1982c971')

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" \
    redmine_client-$pkgver.gem || return 1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
