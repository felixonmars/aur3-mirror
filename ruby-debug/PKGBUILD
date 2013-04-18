# Maintainer: TDY <tdy@archlinux.info>

pkgname=ruby-debug
pkgver=0.10.4
pkgrel=2
pkgdesc="A faster implementation of the standard debug.rb"
arch=('any')
url="http://rubyforge.org/projects/ruby-debug/"
license=('BSD')
depends=('ruby>=1.8.4')
source=(http://rubyforge.org/frs/download.php/73083/$pkgname-$pkgver.gem)
sha256sums=('e77dd86226b9f2a1e2ab287b53fe7bdefce329d5df5dce1bef1ea7a2e59cc5e1')

build() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz
}

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "$pkgdir$_gemdir" $pkgname-$pkgver.gem
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
