# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=fluent-plugin-flume
pkgver=0.1.1
pkgrel=1
pkgdesc='Flume input and output plugin for Fluentd event collector'
arch=('any')
url='https://github.com/fluent/fluent-plugin-flume'
license=('Apache')
depends=('fluentd' 'flume-ng' 'ruby-thrift')
options=(!emptydirs)
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  fluent-gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('fda729db73e53f6947f831ef040a99d5')
