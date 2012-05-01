pkgname=mate-sensors-applet-git
pkgver=20120501
pkgrel=1
pkgdesc="An applet for the MATE Panel to display readings from hardware sensors, including CPU temperature, fan speeds and voltage readings under Linux"
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/mate-sensors-applet"
license=('GPL')
depends=('mate-panel' 'lm_sensors' 'udisks' 'xdg-utils' 'libmateui')
makedepends=('intltool' 'mate-doc-utils' 'git' 'autoconf' 'automake')
options=('!libtool')
conflicts=('mate-sensors-applet')
install=$pkgname.install

_gitroot="https://github.com/mate-desktop/mate-sensors-applet.git"
_gitname="mate-sensors-applet"

build() {
cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
    msg "GIT checkout done"
  
  cd "$srcdir/$_gitname"
  
  ./autogen.sh
  ./configure LDFLAGS="-ldl" --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
  --disable-static --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
