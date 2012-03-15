# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=ruby1.8-i18n-v0.4.2
pkgver=0.4.2
pkgrel=3
pkgdesc="Internationalization (i18n) library for Ruby"
arch=('any')
url="http://github.com/svenfuchs/i18n"
license=('MIT')
depends=('ruby1.8' 'rubygems1.8')
conflicts=('ruby1.8-i18n')
provides=('ruby1.8-i18n=0.4.2')
source=("http://gems.rubyforge.org/gems/i18n-$pkgver.gem")
noextract=('i18n-$pkgver.gem')
md5sums=('be9b3a47b16d0bf29256ff55d6babe09')

build() {
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install -Vl --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" "$srcdir/i18n-$pkgver.gem"
}
