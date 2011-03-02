# Maintainer: Dominik Honnef <dominikh AT fork-bomb DOT org>
pkgname=ruby-cinch
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple, friendly DSL for creating IRC bots"
arch=(any)
url="http://github.com/cinchrb/cinch"
license=(MIT)
depends=("ruby>=1.9.1")
makedepends=(rubygems)
source=(http://rubygems.org/downloads/cinch-$pkgver.gem)
md5sums=('784155f836b3e18a9a475a32f734e8be')
noextract=(cinch-$pkgver.gem)

build() {
  cd $srcdir
   # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
   #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" cinch-$pkgver.gem
}
