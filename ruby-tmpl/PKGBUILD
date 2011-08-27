# Contributor: Baptiste Grenier <baptiste@bapt.name>
pkgname=ruby-tmpl
pkgver=0.2.3
pkgrel=1
pkgdesc="A templating system designed to work with or without mod-ruby."
arch=(i686)
url="http://ruby-tmpl.sourceforge.net"
license=('BSD')
depends=('ruby')
source=(http://prdownloads.sourceforge.net/ruby-tmpl/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('5990050e35ae72d9f34ee78074ae89ce')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  mkdir -p $startdir/pkg/usr/lib/ruby/site_ruby/1.8
  cp $startdir/src/$pkgname-$pkgver/src/ruby-tmpl.rb $startdir/pkg/usr/lib/ruby/site_ruby/1.8 || return 1
}
