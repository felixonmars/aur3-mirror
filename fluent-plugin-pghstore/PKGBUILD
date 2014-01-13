# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=fluent-plugin-pghstore
pkgver=0.2.2
pkgrel=1
pkgdesc='Output to PostgreSQL database which has a hstore extension'
arch=('any')
url='https://github.com/shirou/fluent-plugin-pghstore'
license=('Apache')
depends=('fluentd' 'ruby-pg')
options=(!emptydirs)
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  fluent-gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('da8eca023299efb6ddea315d89dae562')
