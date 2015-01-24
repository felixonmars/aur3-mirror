# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_gemname="zip"
pkgname="ruby-$_gemname"
pkgver="2.0.2"
pkgrel="1"
pkgdesc="A Ruby library for reading and writing Zip files. Unlike the official rubyzip, zip is compatible with Ruby 1.9.1."
arch=("any")
url="https://rubygems.org/gems/zip"
license=("RUBY")
depends=("ruby")
makedepends=("rubygems")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha1sums=("6fabc32da123f7013b2db804273df428a50bc6a4")


package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}
