# Author: crab <crabtw@gmail.com>
# Contributor: LeeF

pkgname=gem2arch-ruby-enterprise
pkgver=0.3.4
pkgrel=0
pkgdesc="Create Arch Linux packages from Ruby Gem Packages for Ruby-Enterprise"
arch=('i686' 'x86_64')
url="http://github.com/crabtw/"
license=('Ruby')
depends=('ruby-enterprise')
source=('gem2arch-enterprise.rb')
md5sums=('bebed79f978ecb9f33aaf82e2f493587')

build() {
  install -D -m755 $srcdir/gem2arch-enterprise.rb $pkgdir/opt/ruby-enterprise/bin/gem2arch-enterprise
}
 
