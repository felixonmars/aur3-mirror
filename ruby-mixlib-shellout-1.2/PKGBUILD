# Maintainder : Alfredo Palhares <masterkorp@masterkorp.net>
_gemname=mixlib-shellout
pkgname=ruby-$_gemname-1.2
pkgver=1.2.0
pkgrel=1
pkgdesc="Run external commands on Unix or Windows - Specific chef version"
arch=(any)
url="http://www.opscode.com/"
license=('MIT')
depends=('ruby' 
#'ruby-rspec>0'
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('cdf0d949c286bd5bc1de607088e512a8')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
