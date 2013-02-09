# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>

pkgname=pacmine
pkgver=0.1.3
pkgrel=1
pkgdesc="A tool to get a list of someone's packages from archlinux.org"
arch=(any)
url="https://rubygems.org/gems/pacmine"
license=('GPL3')
depends=('ruby' 'ruby-commander' 'ruby-hpricot')
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('3314afd7c18395337b856f2fdd9062a05b49608fd65e32b4bf56c554ea07e43e')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
