# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgname=ruby-romkan
pkgver=0.4
pkgrel=1
pkgdesc="a Romaji <-> Kana conversion library for Ruby"
arch=('i686' 'x86_64')
url="http://0xcc.net/ruby-romkan/"
license=('RUBY')
groups=('lib')
depends=('ruby')
source=("http://0xcc.net/ruby-romkan/ruby-romkan-$pkgver.tar.gz")
md5sums=('bc48a51bd6cf0e4ff1d73faffef531fb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/lib/ruby/site_ruby/1.8"
  cp romkan.rb "${pkgdir}/usr/lib/ruby/site_ruby/1.8/" || return 1
}
