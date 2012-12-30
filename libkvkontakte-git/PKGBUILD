# Contributor: Alexander Potashev <aspotashev@gmail.com>
pkgname=libkvkontakte-git
pkgver=20121230
pkgrel=1
pkgdesc="Library implementing VKontakte.ru API"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/libs/libkvkontakte"
license=('GPL')
depends=('kdelibs>=4.0.0' 'qjson')
makedepends=('pkgconfig' 'automoc4' 'git' 'cmake')
conflicts=('libkvkontakte')
provides=('libkvkontakte')
_gitname="libkvkontakte"
_gitroot="git://anongit.kde.org/${_gitname}"

build() {
  cd ${srcdir}
  msg "Connecting to KDE git server..."
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    msg "Repo clone finished"
    cd ${_gitname}
  fi
  cmake . \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
