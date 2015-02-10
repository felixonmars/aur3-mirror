# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>
pkgname=htty
pkgver=1.5.0
pkgrel=1
pkgdesc="The HTTP TTY"
arch=('any')
url="http://htty.github.com"
license=('MIT')
groups=()
depends=('ruby>=1.9' 'ruby-mime-types>=1')
source=("https://rubygems.org/downloads/htty-${pkgver}.gem")
noextract=("htty-${pkgver}.gem")
sha256sums=('a94593f8499f2308ac436912128872fe3c01d7f8462ff07b43d0a0e4d1a1e341')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
