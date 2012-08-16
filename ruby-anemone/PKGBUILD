# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Maintainer: Nikolay Bogoychev <nheart@gmail.com>
pkgname=ruby-anemone
pkgver=0.7.2
pkgrel=1
pkgdesc="ruby gem for anemone, a website spider framework."
arch=(any)
url="http://anemone.rubyforge.org/"
license=('MIT')
depends=('ruby' 'ruby-robots' 'ruby-nokogiri') 
makedepends=('rubygems')
source=("http://rubygems.org/downloads/anemone-$pkgver.gem")
noextract=("anemone-$pkgver.gem")
md5sums=('5eea2f32cec1c95ab193f6447e69cbb9')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" anemone-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

