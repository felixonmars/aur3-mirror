# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=ncursesw-sup
pkgname=ruby-$_gemname
pkgver=1.3.1.3
pkgrel=1
pkgdesc="Ruby wrapper for ncurses providing wide character support."
arch=(any)
url="http://ncurses-ruby.berlios.de/"
license=('LGPL')
depends=(ruby)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('8724a3f785c68edba7b7646e34c9f5f1')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
