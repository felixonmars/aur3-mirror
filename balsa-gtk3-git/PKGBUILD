# Maintainer: Carlos Franke <carlos_franke at lemtank dot de>

pkgname=balsa-gtk3-git
_gitname=$pkgname
pkgver=2.5.1.68.gbaa96b7
pkgrel=1
pkgdesc="GTK3 branch of the Balsa e-mail client"
arch=('i686' 'x86_64')
url="http://pawsa.fedorapeople.org/balsa/"
license=('GPL')
depends=('gmime' 'webkitgtk' 'libesmtp' 'libnotify' 'gpgme' 'gtksourceview3' 'gtk3' 'gtkspell3' 'gnome-icon-theme' 'desktop-file-utils' 'compface')
makedepends=('git')
provides=('balsa')
conflicts=('balsa')
#options=('!strip') #debug
source=("$_gitname::git://git.gnome.org/balsa#branch=gtk3")
install=balsa.install
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  #Adjust to your needs:
  ./autogen.sh --with-compface --with-gnome=no --with-gpgme --with-gtksourceview --with-html-widget=webkit --with-nm=no --with-ssl #--disable-threads 
  make
  #make CFLAGS="-g -O2" #debug
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
