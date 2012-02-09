pkgname=irsnot-git
pkgver=20120209
pkgrel=1
pkgdesc="An irssi dbus notification script."
arch=('i686' 'x86_64')
url="https://github.com/nuisanceofcats/irsnot"
license=('MPL' 'GPL' 'LGPL')
depends=('perl-desktop-notify' 'irssi')
makedepends=('git')
provides=(irsnot)

_gitroot="git://github.com/nuisanceofcats/irsnot.git"
_gitname="irsnot"

build() {
  cd $srcdir

 ## Git checkout
  if [ -d $srcdir/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin  || return 1
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}  || return 1
  fi
  msg "Checkout completed"
}

package() { 
  cd $srcdir/${_gitname}
  mkdir -p "$pkgdir/usr/share/irssi/scripts/"
  mkdir -p "$pkgdir/usr/share/doc/irssi/"
  cp irsnot.pl "$pkgdir/usr/share/irssi/scripts/"
  cp irsnotrc.sample "$pkgdir/usr/share/doc/irssi/"
} 
