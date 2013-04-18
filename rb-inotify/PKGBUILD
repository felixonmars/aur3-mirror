# Maintainer: Renzo Carbonara <gnuk0001@gmail.com>
pkgname=rb-inotify
pkgver=0.8.5
pkgrel=3
pkgdesc="Interface to inotify from ruby"
arch=('any')
url="https://rubygems.org/gems/rb-inotify"
license=('MIT')
groups=()
depends=('ruby-ffi')
makedepends=('rubygems' 'ruby-yard')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/rb-inotify-${pkgver}.gem")
noextract=("rb-inotify-${pkgver}.gem")

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" --no-user-install \
              rb-inotify-$pkgver.gem -n "$pkgdir/usr/bin"
}

md5sums=('ab6390f9b1b4422ada249d1c8ebf4c7c')

# vim:set ts=2 sw=2 et:
