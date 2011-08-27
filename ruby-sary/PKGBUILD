# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=ruby-sary
pkgver=1.2.0
pkgrel=1
_filename=sary-ruby
pkgdesc="Ruby binding for sary"
arch=("i686" "x86_64")
url="http://sary.sourceforge.net/"
license=('GPL')
depends=('ruby' 'sary')
options=('!libtool')
source=(http://sary.sourceforge.net/${_filename}-${pkgver}.tar.gz)
md5sums=('c885abffea72f25cb0f6286770a78ac1')

build() {
  cd ${srcdir}/${_filename}-${pkgver}
  
  ruby extconf.rb
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
