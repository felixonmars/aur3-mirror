# Maintainer: Mat Schaffer <mat@schaffer.me>
# Contributor: Mikhail Felixoid Shiryaev <mr.felixoid@gmail.com>
_gemname=knife-solo
pkgname=ruby-$_gemname
pkgver=0.4.1
pkgrel=1
arch=('any')
pkgdesc='Handles bootstrapping, running chef solo, rsyncing cookbooks etc'
url='http://matschaffer.github.io/knife-solo/'
license=('GPL')
depends=('ruby-chef' 'ruby-erubis' 'ruby-net-ssh')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('851510b3105268261f7656dc8b4d86cb55cf73cd5405638ff6e38aa5132d86a2')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  # Removing files with references to $pkgdir
  find "$pkgdir" -depth -type f -name "Makefile*" -exec rm {} \;
}

# vim:set ts=2 sw=2 et:
