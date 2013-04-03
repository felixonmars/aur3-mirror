# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Danny Navarro <j@dannynavarro.net>
# Contributor: Joris Steyn <jorissteyn@gmail.com>

pkgname=ruby-fssm
_gemname=${pkgname#ruby-}
pkgver=0.2.10
pkgrel=1
pkgdesc="Filesystem event notification library"
arch=('any')
url="http://github.com/ttilley/fssm"
license=('MIT')
groups=()
depends=('ruby')
makedepends=('rubygems')
optdepends=('rb-inotify>=0.5.1')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('84c339af7eec2b408c757be5912579a8')

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
              -n "$pkgdir/usr/bin" ${_gemname}-$pkgver.gem
  install -D "$pkgdir$_gemdir/gems/${_gemname}-$pkgver/LICENSE" \
             "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

