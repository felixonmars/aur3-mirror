# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
pkgname=ruby-knife-solo_data_bag
pkgver=1.1.0
pkgrel=1
pkgdesc="A knife plugin for working with data bags and chef solo."
arch=('any')
url="https://github.com/thbishop/knife-solo_data_bag"
license=('Apache')
depends=('ruby')
options=(!emptydirs)
changelog=$pkgname.changelog
source=(http://rubygems.org/downloads/knife-solo_data_bag-$pkgver.gem)
noextract=(knife-solo_data_bag-$pkgver.gem)
md5sums=('2f7ee2f2b0fbb558a6769efdee6149c8')

build() {
  cd "$srcdir"

  local gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
      --install-dir "$srcdir$gemdir" --bindir "$srcdir/usr/bin" \
      "knife-solo_data_bag-$pkgver.gem"
}

package () {
  cd "$srcdir"

  cp -R usr "$pkgdir"
}
