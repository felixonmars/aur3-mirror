# Contributor: Andreas W. Hauser

pkgname=ruby1.9-crfpp
pkgver=0.51
pkgrel=2
pkgdesc="A Conditional Random Field implementation"
url="http://crfpp.sourceforge.net"
arch=(x86_64 i686)
license=(LGPL BSD)
depends=(ruby1.9 crfpp)
source=(http://prdownloads.sourceforge.net/sourceforge/crfpp/CRF++-$pkgver.tar.gz)

build() {
  cd $startdir/src/CRF++-$pkgver/ruby
  ruby-1.9 extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('8de92841e89348c5937ebc0430e33465')
