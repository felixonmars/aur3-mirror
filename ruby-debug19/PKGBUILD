# Maintainer: TDY <tdy@gmx.com>

pkgname=ruby-debug19
pkgver=0.11.6
pkgrel=2
pkgdesc="A faster implementation of the standard debug.rb using native core Ruby 1.9.x APIs"
arch=('any')
url="http://rubyforge.org/projects/ruby-debug19/"
license=('LGPL')
depends=('ruby>=1.9')
install=$pkgname.install
source=(http://rubyforge.org/frs/download.php/63094/$pkgname-$pkgver.gem)
md5sums=('73bc88012167fd82464a8e7fd4dd8b4f')

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies $pkgname-$pkgver.gem -n "$pkgdir/usr/bin" \
    -i "$pkgdir$_gemdir"
}
