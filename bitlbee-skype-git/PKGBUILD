# Maintainer: nullren <chopflop@gmail.com>
pkgname=bitlbee-skype-git
pkgver=20110607
pkgrel=1
pkgdesc="Skype plugin for BitlBee"
arch=(i686 x86_64)
url="http://vmiklos.hu/project/bitlbee-skype/"
license=('GPL')
depends=(bitlbee skype4py pygtk python2-pyopenssl dbus-python)
makedepends=('git')
provides=(bitlbee-skype)
conflicts=(bitlbee-skype)

_gitname="bitlbee-skype"
_gitroot="git://vmiklos.hu/${_gitname}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  make autogen
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
} 
