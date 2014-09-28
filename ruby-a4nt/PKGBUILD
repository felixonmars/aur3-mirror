# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=a4nt
pkgname=ruby-$_gemname
pkgver=2.0.1
pkgrel=1
pkgdesc='A4nt is a simple announcements plugin for Ruby on Rails.'
arch=(any)
url='https://github.com/ma2gedev/a4nt'
license=(MIT)
depends=(ruby ruby-rails)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('58ec3e00b5c1d1fc37120b8607a624aad1909bad')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
