# Maintainer: Gerasev Kirill  <gerasev.kirill@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-lxde
_realname=${pkgname/-lxde/}
pkgver=20121124
pkgrel=1
pkgdesc="Menu editor for lxde (and others). Without gnome or xfce dependencies."
arch=(any)
license=('LGPL')
url="http://www.gnome.org"
depends=('gnome-menus' 'python2-gobject' 'light-desktop-item-edit-git')
conflicts=('alacarte' 'alacarte-xfce' 'alacarte-git' 'alacarte-xfce-devel' 'alacarte-lxde')
makedepends=('intltool' 'gnome-common')
provides=('alacarte')
options=('!libtool')
groups=('lxde')
install=$_realname.install
source=(
        remove_help_button.patch
        gnome_fix.patch
        )

sha256sums=(
            '9d6624e75b88a8430eb2c4c8ea6d84d7e1172dd8f789b569ad10a6445cf7ce49'
            'ecae1344bb63236ec1696c784ec45a64e0cb637c4684a9de2afb188f96feeb4f'
            )


_gitroot="git://git.gnome.org/alacarte"
_gitname="alacarte"

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
  #version before 3.72
  git checkout 	d006c5533287ea34cfefc4b42367ea2aa213d0cf 
  #
  # BUILD HERE
  #

  patch -Np1 -i   ../remove_help_button.patch
  patch -Np1 -i   ../gnome_fix.patch
  sed -e 's/gnome-desktop-item-edit/light-desktop-item-edit/g' -i Alacarte/MainWindow.py
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
