# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=pidgin-rhythmbox
pkgver=2.0
pkgrel=1
pkgdesc="A plugin that will automatically update your Pidgin user info and status message with the currently playing music in Rhythmbox"
arch=('i686')
url="http://jon.oberheide.org/projects/pidgin-rhythmbox/"
license="GPL"
depends=('pidgin' 'rhythmbox')
replaces=('gaim-rhythmbox')
source=(http://jon.oberheide.org/projects/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('d4c7329b6dc8311dfd7d75299537c68e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  # libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;	
}
