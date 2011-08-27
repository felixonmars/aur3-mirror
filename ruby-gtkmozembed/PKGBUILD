# Maintainer: Jeff Wallace <jeff@tjwallace.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ruby-gtkmozembed
pkgver=0.19.4
pkgrel=1
pkgdesc="Ruby GtkMozEmbed bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby' 'gtk2' 'nspr' 'xulrunner' 'ruby-gtk2')
source=("http://downloads.sourceforge.net/project/ruby-gnome2/ruby-gnome2/ruby-gnome2-$pkgver/ruby-gnome2-all-$pkgver.tar.gz")
md5sums=('40451e4173e2c8bcd5046aea7e499ef9')


build() {
  cd $startdir/src/ruby-gnome2-all-$pkgver/gtkmozembed
  ruby extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install
}
