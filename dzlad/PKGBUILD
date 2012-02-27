# Maintainer:  lolilolicon <lolilolicon#gmail#com>
# Contributor: lolilolicon <lolilolicon#gmail#com>

pkgname=dzlad
pkgver=0.1.3
pkgrel=2
pkgdesc="Command line interface to AUR written in Ruby"
arch=(any)
url="http://lolilolicon.github.com/dzlad"
license=('MIT')
depends=(ruby)
source=(http://github.com/downloads/lolilolicon/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3d2d320630e73fe7f96631943ae2d952')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d                     "$pkgdir/usr/lib/ruby/vendor_ruby/1.9.1/dzlad"
  install -m  644 lib/dzlad/*.rb "$pkgdir/usr/lib/ruby/vendor_ruby/1.9.1/dzlad"
  install -Dm 644 lib/dzlad.rb   "$pkgdir/usr/lib/ruby/vendor_ruby/1.9.1/"
  install -Dm 755 bin/dzlad      "$pkgdir/usr/bin/dzlad"

  install -Dm 644 LICENSE        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
