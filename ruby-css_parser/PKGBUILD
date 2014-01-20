# Maintainer: Madalin Ignisca <madalin.ignisca@gmail.com>

pkgname=ruby-css_parser
pkgver=1.3.5
pkgrel=1
pkgdesc="A set of classes for parsing CSS in Ruby."
arch=(i686 x86_64)
url="https://github.com/alexdunae/css_parser"
license=("MIT")
groups=()
depends=("ruby-addressable")
makedepends=("rubygems")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/css_parser-${pkgver}.gem")
noextract=("css_parser-${pkgver}.gem")
sha256sums=('a1117c1a3b193c49f27623be20b4250ac759e77eadc315c37350244117f5ae42')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" css_parser-$pkgver.gem \
	  -n "${pkgdir}/usr/bin" || return 1

  install -d -m755 "${pkgdir}/usr/share/licenses/css_parser" || return 1
}
