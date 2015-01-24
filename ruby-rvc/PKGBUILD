# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_gemname="rvc"
pkgname="ruby-$_gemname"
pkgver="1.8.0"
pkgrel="2"
pkgdesc="A Linux console UI for vSphere, built on the RbVmomi bindings to the vSphere API."
arch=("any")
url="https://labs.vmware.com/flings/rvc"
license=("custom")
depends=("ruby" "ruby-backports" "ruby-highline" "ruby-rbvmomi" "ruby-terminal-table" "ruby-trollop" "ruby-zip")
optdepends=("ruby-ffi: Better tab completion.")
makedepends=("rubygems")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha1sums=("17e62182513816baa3b6a7865a2038641fa00c2e")


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
