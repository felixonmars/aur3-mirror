# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=net-ftp-list
pkgname=ruby-$_gemname
pkgver=3.2.5
pkgrel=1
pkgdesc="Parse FTP LIST command output."
arch=(any)
url="http://github.com/stateless-systems/net-ftp-list"
license=('MIT')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('be8f30f6f6ecf6cd05445ad6c36b0cda')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
