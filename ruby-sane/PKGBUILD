# Maintainer: TDY <tdy@archlinux.info>

pkgname=ruby-sane
pkgver=0.23.4
pkgrel=1
pkgdesc="Extensions of ruby-core"
arch=('any')
url="http://rubygems.org/gems/sane/"
license=('unknown')
depends=('ruby-os' 'ruby-andand')
source=(http://rubygems.org/downloads/sane-$pkgver.gem)
md5sums=('c3a32f00785135e6a65d7fc79ba9a9fc')

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    sane-$pkgver.gem
}
