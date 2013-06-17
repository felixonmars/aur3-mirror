# Maintainer: fauno <fauno@kiwwwi.com.ar>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail dot com>

pkgname=ruby-headers
_pkgname=ruby
pkgver=2.0.0_p195
_pkgver=2.0.0-p195
pkgrel=1
pkgdesc="A package of all Ruby headers needed by some gems like ruby-debug."
arch=('any')
url="http://www.ruby-lang.org/en/"
license=('GPL2' 'custom:Ruby')
depends=("ruby=$pkgver")
source=("http://ftp.ruby-lang.org/pub/ruby/2.0/$_pkgname-$_pkgver.tar.bz2")

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  _hdrdir=`ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['rubyhdrdir']"`

  install -d "$pkgdir$_hdrdir/$_pkgname-$_pkgver"
  install -m644 *.{h,inc} "$pkgdir$_hdrdir/$_pkgname-$_pkgver"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('2f54faea6ee1ca500632ec3c0cb59cb6')
