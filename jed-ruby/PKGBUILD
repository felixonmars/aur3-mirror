# Contributor: Carl Mueller arch at carlm e4ward com
# Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=jed-ruby
pkgver=1.16
pkgrel=3
pkgdesc="Ruby mode for jed text editor."
url="http://www.jedsoft.org/jed"
license="GPL2"
depends=('jed')
arch=('i686' 'x86_64')
source=(http://jedmodes.cvs.sourceforge.net/jedmodes/mode/ruby/ruby.sl)
md5sums=('58009138bd3a41486dab0685726fefdd')

build() {
 install -d ${pkgdir}/usr/share/jed/lib
 install -D ${srcdir}/ruby.sl ${pkgdir}/usr/share/jed/lib/
 }
 
