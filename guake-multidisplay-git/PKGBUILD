# Maintainer: jellysheep <max DOT mail AT dameweb DOT de>
# Contributor: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>

pkgname=guake-multidisplay-git
_pkgname=guake-git
pkgver=0.4.4.13.gdc71f60
pkgrel=1
pkgdesc="Top-down terminal for Gnome (multidisplay patch)."
arch=('i686' 'x86_64' 'armv7h')
url="http://guake.org/"
license=('GPL')
depends=('python2' 'pygtk' 'gnome-python' 'vte' 'python2-notify' 'python2-dbus' 'python2-xdg' 'pkgconfig' 'gtk2' 'glib2')
makedepends=('git' 'intltool' 'gnome-common')
conflicts=('guake')
provides=('guake')
source=("$_pkgname"::'git://gitorious.org/guake/guake.git' 'guake-git.patch' "0003-multi-display-gui.patch")
sha512sums=('SKIP'
            'b7094dd78a4bf92747c4b468d91c7d63d6d86aa7a411e9e4cb1c26b77f14169c7fabfa31b88e5078f1a751c2d163fd6b9fce9b590bb89aaa3d1e5b7d48588157'
            'e8a7f9445be1b9027c33254c18f23cf76ef2e36e67683822f8d3d5457c7895b2e855b3eceff38be7f39e145237dbb47558fc8a07c8bf482fdd1f1466e1bed4bd')
install=guake.install

_gitroot="git://gitorious.org/guake/guake.git"

pkgver() {
  cd $_pkgname
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

prepare() {
  cd $_pkgname
  patch -Np1 -i $srcdir/$_pkgname.patch
  patch -Np1 -i $srcdir/0003-multi-display-gui.patch
}

build(){
  cd $_pkgname
  PYTHON="`which python2`" ./autogen.sh --prefix=/usr --sysconfdir=/usr/share --disable-static 
  make
}

package() {
  cd $_pkgname
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
