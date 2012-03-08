# Maintainer: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Fixer: Mephisto Pheles <mephisto.pheles.nyan@gmail.com>

pkgname=clearwaita-gtk-theme
pkgver=20120308
pkgrel=1
pkgdesc="GTK2/GTK3 theme visually close to Clearlooks"
arch=('i686' 'x86_64')
url="http://www.jpfleury.net"
license=('GPL')
depends=('gtk-engines' 'gnome-themes-standard')
makedepends=('git')

_gitroot="git://jpfleury.indefero.net/jpfleury/clearwaita.git"
_gitname="Clearwaita"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_gitname} ${pkgdir}/usr/share/themes
  rm -rf ${pkgdir}/usr/share/themes/Clearwaita/.git
}
