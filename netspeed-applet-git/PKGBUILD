# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=netspeed-applet
pkgname=$_pkgname-git
pkgver=20111113
pkgrel=1
pkgdesc="GNOME applet that shows how much traffic occurs on a specified network device"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/netspeed/"
license=('GPL')
depends=('gnome-panel>=3.0.0' 'libgtop>=2.14.2' 'wireless_tools>=28' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool' 'gnome-doc-utils')
provides=('netspeed-applet')
conflicts=('netspeed-applet')
install=$_pkgname.install
source=(01_stock_icons.patch
        02_dbus.patch
        03_gtk3.patch)
md5sums=('e1b77676455b42c93a385b22c28eb0e6'
         '69066ec62f861658a12b41fe2f6865fd'
         'e824b8ef31c35ab5fcc13f1e0bc50667')

_gitroot="git://git.gnome.org/netspeed"
_gitname="netspeed"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  patch -Np1 -i "$srcdir/01_stock_icons.patch"
  patch -Np1 -i "$srcdir/02_dbus.patch"
  patch -Np1 -i "$srcdir/03_gtk3.patch"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
               --disable-static --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
