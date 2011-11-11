# Maintainer: Brandon Thomas <brandon.thomas@gmail.com>
pkgname=evolution-ews
pkgver=20111111
pkgrel=1
pkgdesc="Evolution support for Exchange Web Services, the SOAP-based protocol that obsoletes MAPI, as of Exchange 2007"
arch=('i686' 'x86_64')
license=('GPL')
url="http://live.gnome.org/Evolution/EWS"
depends=('evolution-data-server' 'gtkhtml4' 'gnome-desktop' 'libunique3')
makedepends=('git' 'intltool' 'evolution' 'gnome-common' 'gtk-doc' 'autoconf' 'automake' 'pkg-config')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_gitroot="git://git.gnome.org/evolution-ews"
_gitname="evolution-ews"
_gitbranch="gnome-3-2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull
    msg "The local files are updated."
  else
    git clone -b $_gitbranch $_gitroot
    msg "GIT checkout done or server timeout"
  fi

  msg "Starting make..."

  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/evolution --disable-static \
    --enable-gtk3
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}
