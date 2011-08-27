# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgname=ruby-bsearch
pkgver=1.5
pkgrel=1
pkgdesc="a binary search library for Ruby"
arch=('i686' 'x86_64')
url="http://0xcc.net/ruby-bsearch/"
license=('RUBY')
groups=('lib')
depends=('ruby')
source=("http://0xcc.net/ruby-bsearch/ruby-bsearch-$pkgver.tar.gz")
md5sums=('fb3cb15bb3546fb3b5d4ba5a61baeea1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/lib/ruby/site_ruby/1.8"
  cp bsearch.rb "${pkgdir}/usr/lib/ruby/site_ruby/1.8/" || return 1
}
