# Maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=lxsession-edit-git
pkgver=20110826
pkgrel=1
pkgdesc="A session editor for the LXDE desktop."
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk2>=2.12.0')
makedepends=('git' 'intltool' 'pkgconfig')
optdepends=()
provides=('lxsession-edit')
conflicts=('lxsession-edit')

_gitroot='git://lxde.git.sourceforge.net/gitroot/lxde/lxsession-edit'
_gitname=lxsession-edit

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's#_Name=Desktop Session#Name=Desktop Session#g' lxsession-edit.desktop
  sed -i 's#_Comment=Manage applications#Comment=Manage applications#g' lxsession-edit.desktop
  make DESTDIR="$pkgdir" install
}
