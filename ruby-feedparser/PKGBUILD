# Maintainer: fauno <fauno@kiwwwi.com.ar>
pkgname=ruby-feedparser
pkgver=0.7
pkgrel=1
pkgdesc="Ruby-Feedparser is an RSS and Atom parser for Ruby. It was initially developed for Feed2Imap, but it is now a standalone library."
arch=('any')
url="http://home.gna.org/ruby-feedparser"
license=('GPL2')
depends=('ruby')
makedepends=('ruby')
md5sums=('a075b191e318f7f57025088ac03baf8b')
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

  rake test || return 1

}
