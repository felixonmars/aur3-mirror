# Maintainer: fauno <fauno@kiwwwi.com.ar>
pkgname=feed2imap
pkgver=1.0
pkgrel=1
pkgdesc="RSS/Atom feed aggregator that uploads them to a specified folder of an IMAP mail server or copies them to a local maildir"
arch=('any')
url="http://home.gna.org/feed2imap/"
license=('GPL2')
depends=('ruby-feedparser' 'ruby-rmail')
makedepends=('ruby')
md5sums=('c34929e4359b49d5be15022e5177f94b')

source=(http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tgz)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./setup.rb config \
             --prefix=${pkgdir}/usr \
             --sysconfdir=${pkgdir}/etc \
             --rubypath="/usr/bin/env ruby" \
             --libruby=$pkgdir/usr/lib/ruby \
             --librubyver=$pkgdir/usr/lib/ruby/1.9.1 \
             --siteruby=$pkgdir/usr/lib/ruby/1.9.1 \
             --siterubyver=$pkgdir/usr/lib/ruby/1.9.1
    

  ./setup.rb install || return 1

  #rake test || return 1

}
