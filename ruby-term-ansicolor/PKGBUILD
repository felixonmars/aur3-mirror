# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux AT free DOT fr>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>

pkgname=ruby-term-ansicolor
_pkgname=term-ansicolor
pkgver=1.2.2
pkgrel=2
pkgdesc="A ruby library that colors strings using ANSI escape sequences"
arch=(any)
url="https://rubygems.org/gems/term-ansicolor"
license=('GPL')
depends=(ruby ruby-tins)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_pkgname-$pkgver.gem)
noextract=($_pkgname-$pkgver.gem)
md5sums=('4c875a6efa46099beb41bb175471c7d4')

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
}
