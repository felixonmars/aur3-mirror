# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_gemname="rbvmomi"
pkgname="ruby-$_gemname"
pkgver="1.8.2"
pkgrel="2"
pkgdesc="Ruby interface to the VMware vSphere API."
arch=("any")
url="https://github.com/vmware/rbvmomi"
license=("custom")
depends=("ruby" "ruby-builder" "ruby-nokogiri" "ruby-trollop")
makedepends=("rubygems")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha1sums=("565ad4c8433fa38154a00ad661c7e36ad060f9d0")


package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/ruby/gems/2.2.0/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
