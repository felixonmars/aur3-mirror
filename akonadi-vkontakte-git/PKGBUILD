# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
pkgname=akonadi-vkontakte-git
pkgver=20110622
pkgrel=1
pkgdesc="Akonadi plugin for Vkontakte, git version"
arch=('i686' 'x86_64')
url="https://github.com/aspotashev/akonadi-vkontakte"
license=('GPL')
depends=('kdelibs' 'akonadi' 'qjson' 'boost')
makedepends=('pkgconfig' 'automoc4' 'git' 'cmake')
_gitroot='git://github.com/aspotashev/akonadi-vkontakte.git'
_gitname='akonadi-vkontakte'

build() {
  cd ${srcdir}
  msg "Connecting to Github..."
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
