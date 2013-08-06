# Maintainer: TDY <tdy@archlinux.info>

pkgname=ruby-whichr
pkgver=0.3.6
pkgrel=1
pkgdesc="Ruby implementation of the which command"
arch=('any')
url="http://rubygems.org/gems/whichr/"
license=('unknown')
depends=('ruby-sane')
source=(http://rubygems.org/downloads/whichr-$pkgver.gem)
md5sums=('1ec0bb2de6fc626bd1c982a46e562a25')

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    whichr-$pkgver.gem
}
