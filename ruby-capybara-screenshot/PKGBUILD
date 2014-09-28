# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=capybara-screenshot
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Automatically create snapshots when Cucumber steps fail with Capybara and Rails'
arch=(any)
url='http://github.com/mattheworiordan/capybara-screenshot'
license=(MIT)
depends=(ruby ruby-capybara ruby-launchy ruby-colored)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8781257320af4e5e0901304f36df02526862a622')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
