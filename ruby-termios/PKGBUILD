# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Ruby_Gem_Package_Guidelines for more
# information on Ruby Gem packaging.

# Maintainer: Joakim Reinert <mail (at) jreinert.com>
_gemname=ruby-termios
pkgname=$_gemname
pkgver=0.9.6
pkgrel=1
pkgdesc="Termios module is simple wrapper of termios(3)"
arch=(any)
url="https://github.com/arika/ruby-termios"
license=('BSDL')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=(f6067f18fe1efb7453540c68c54f994c3509e166a96f0c23173f5558ac909d5016abc9b5984ce7f8321203211133ddc9aac6c6729f6669925f1d784eaf9efbc5)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
