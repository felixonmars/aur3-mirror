# Contributor: crab <crabtw@gmail.com>

pkgname=gem2arch-ruby
pkgver=0.6
pkgrel=1
pkgdesc="Create PKGBUILD from Ruby Gem Package"
arch=('i686' 'x86_64')
url="http://github.com/crabtw/"
license=('Ruby')
depends=('ruby' 'rubygems')
source=('gem2arch.rb')
md5sums=('5c1309a3820df1f1ccc027c15d2c5886')

package() {
  install -D -m755 $srcdir/gem2arch.rb $pkgdir/usr/bin/gem2arch-ruby
}
