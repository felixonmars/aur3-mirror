# Maintainer: TDY <tdy@archlinux.info>

pkgname=ruby-librmpd
pkgver=0.1.1
pkgrel=3
pkgdesc="A simple MPD library for Ruby"
arch=('any')
url="http://librmpd.rubyforge.org/"
license=('GPL')
depends=('ruby')
source=(http://rubyforge.org/frs/download.php/15722/librmpd-$pkgver.gem)
sha256sums=('3b019ad1aff4a2f0681e77daf47b4623050b40d9f8360ce2d67112b139018d90')

package() {
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies ${pkgname/*-}-$pkgver.gem \
    -i "$pkgdir$_gemdir" --no-user-install -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
