# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=rmail
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="RMail is a lightweight mail library containing various utility classes and modules that allow ruby scripts to parse, modify, and generate MIME mail messages."
arch=(any)
url="https://rubygems.org/gems/rmail"
license=('unknown')
depends=(ruby)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('c94a6595a71aec61da5723699caea38c')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
