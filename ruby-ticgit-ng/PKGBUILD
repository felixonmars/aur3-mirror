# Maintainer: Your Name <youremail@domain.com>
_gemname=TicGit-ng
pkgname=ruby-ticgit-ng
pkgver=1.0.2.14
pkgrel=1
pkgdesc="Ticketing system built on Git that is kept in a separate branch in your projects Git repository"
arch=(any)
url="https://github.com/jeffWelling/ticgit"
license=('GPL')
depends=(ruby ruby-git ruby-sinatra ruby-haml ruby-sass)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('2bc7c35e8abf148ab5d65d937ae32d61')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when http://ideone.com/7fk5DVthe PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
