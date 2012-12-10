# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vixn-git
pkgver=20121210
pkgrel=1
pkgdesc="vi implemented in python - git version"
arch=('any')
url="http://www.vixn.org"
license=('GPL')
depends=('pygtk' 'pygtksourceview2' 'python2-xdg' 'hicolor-icon-theme')
optdepends=('python2-dbus')
makedepends=('git')
provides=('vixn')
conflicts=('vixn')
install=vixn.install
source=(vixn-python2.patch)
md5sums=('cb634fbae6ae169733809bfc03653ad3')

_gitroot="git://git.tuxfamily.org/gitroot/vixn/vixn.git"
_gitname="vixn"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  install -d $pkgdir/usr/doc
  cd $srcdir/$_gitname-build
  patch -p1 < "$srcdir/vixn-python2.patch"
  cp vixn.py.in vixn.py
  (cd docs/html && rm menus.txt && ln -s ../../config/menus menus.txt)
  ./install.sh $pkgdir/usr
  sed -i s+Exec=/usr/local/bin/vixn+Exec=vixn+ org.vixn.service 
  install -Dm644 org.vixn.service $pkgdir/usr/share/dbus-1/services
  cd $pkgdir/usr/bin
  ln -s ../lib/vixn/vixn.py vixn
  ln -s ../lib/vixn/vixgrep .
  rmdir $pkgdir/usr/doc
}
