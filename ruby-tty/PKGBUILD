# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=tty
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='A toolbox for developing beautiful command line clients. It provides a fluid interface for gathering input from the user, querying system and terminal and displaying information back.'
arch=(any)
url='http://peter-murach.github.io/tty/'
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('96d189c6c4fafe783a2ccea133a7773d9601f7ff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
