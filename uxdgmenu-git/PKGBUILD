# Contributor: 3ED_0 <krzysztof1987/google>
# Contributor: SmiL3y <xakepa10@gmail.com>

pkgname=uxdgmenu-git
_gitname=uxdgmenu
pkgver=20130627
pkgrel=1
pkgdesc="Automated XDG menu system for alternative Linux window wanagers"
arch=('i686' 'x86_64')
url="https://github.com/ju1ius/uxdgmenu"
license=(custom)
makedepends=('git')
depends=('inotify-tools' 'python2-xdg' 'pygtk')
optdepends=('menu-cache: menus caching mechanism'
            'python2-dbus: for monitoring, mounting and unmounting devices')

source=("${_gitname}::git://github.com/ju1ius/uxdgmenu.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
  cd ${_gitname}
  msg2 "Fixing missing bin dir..."
  install -dm755 "usr/bin"
  msg2 "Fixing scripts to use python2..."
  find -type f -name "*.py" -print0 | xargs -0 perl -pi -e 's|^#!.*python.*$|#!/usr/bin/python2|'
}
build() {
  cd ${_gitname}
  make
}
package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
