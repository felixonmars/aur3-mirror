# Maintainer: Jörg Hansen <joerg.hansen@ymail.com>

gemname=cicphash
pkgname=ruby-$gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="Case Insensitive Cash Preserving Hash"
arch=('any')
url="https://github.com/jeremyevans/ruby-cicphash"
license=('RUBY')
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$gemname-$pkgver.gem)
noextract=($gemname-$pkgver.gem)
md5sums=('b99c5fd2ac5eb7ca61a8a1fbed9f86c1')

build() {
    cd $srcdir
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $gemname-$pkgver.gem
}
