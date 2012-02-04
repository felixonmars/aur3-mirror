# Maintainer: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-gconf2
pkgver=0.90.5
pkgrel=1
pkgdesc="Ruby GConf2 bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2' 'gconf')
makedepends=('ruby-pkgconfig')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('58ee234ef8b121b11de8a245c61cd4a9')

build() {
  cd "$srcdir/ruby-gnome2-all-$pkgver"
  ruby extconf.rb gconf 
  make
  if [ ! -e gconf/src/gconf2.so ]; then
     msg 'Build failed'
     return 1
  fi
}
package() {
  cd "$srcdir/ruby-gnome2-all-$pkgver"
  make DESTDIR="$pkgdir" install  
}
