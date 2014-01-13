# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=fluent-plugin-redis
pkgver=0.2.0
pkgrel=1
pkgdesc='Redis output plugin for Fluent'
arch=('any')
url='http://github.com/yuki24/fluent-plugin-redis'
license=('Apache')
depends=('fluentd' 'ruby-redis')
options=(!emptydirs)
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  fluent-gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('7feb7e493e934887a758e4b286a3356b')
