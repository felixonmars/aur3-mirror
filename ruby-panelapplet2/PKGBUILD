# Contributor: Giuseppe Borzi <gborzi@ieee.org>
# Maintainer: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: Juhani Kurki <coldfinger@last4seasons.net>

pkgname=ruby-panelapplet2
pkgver=0.19.1
pkgrel=1
pkgdesc="Ruby binding of libpanel-applet-2.6.x."
url="http://ruby-gnome2.sourceforge.jp"
license="LGPL"
arch=('i686' 'x86_64')
depends=('ruby-glib2' 'ruby-gtk2' 'gnome-panel' 'libgnome' 'libgnomeui')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('d40a03e79ac2a6e6a786ed5a4851337d')

build() {
    cd $srcdir/ruby-gnome2-all-$pkgver
    ruby extconf.rb panel-applet || return 1
    make || return 1  
    make DESTDIR=$pkgdir install || return 1  
    rm -f $pkgdir/usr/lib/pkgconfig
}
