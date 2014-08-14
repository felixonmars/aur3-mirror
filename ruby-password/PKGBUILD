# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Ruby_Gem_Package_Guidelines for more
# information on Ruby Gem packaging.

# Maintainer: Joakim Reinert <mail (at) jreinert.com>
_gemname=ruby-password
pkgname=$_gemname
pkgver=0.15.5
pkgrel=2
pkgdesc="Ruby/Password is a suite of password handling methods for Ruby"
arch=(any)
url="http://www.caliban.org/ruby/ruby-password.shtml"
license=('GPL')
depends=(ruby ruby-termios cracklib) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=(001f1190f240d5f98c8f21ff654610db0017df4cb752e0961d3d0c0a6887519b2a23e35ca528a7772a49cca0b642753ec3dc2b54cdb8c664a6629f916bb62834)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem" -- --with-crack-dict=/usr/share/cracklib/pw_dict.pwd
}

# vim:set ts=2 sw=2 et:
