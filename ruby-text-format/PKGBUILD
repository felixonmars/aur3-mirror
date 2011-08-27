# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=ruby-text-format
pkgver=1.0.0
pkgrel=1
pkgdesc="Gem which provides the ability to nicely format fixed-width text with knowledge of the writeable space"
arch=(any)
url="http://rubygems.org/gems/text-format"
license=('GPL')
depends=(ruby-text-hyphen) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/text-format-$pkgver.gem)
noextract=(text-format-$pkgver.gem)
md5sums=('7b08f134e605da252c23afedbb481beb')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  # makepkg will exit with an error when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" text-format-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
