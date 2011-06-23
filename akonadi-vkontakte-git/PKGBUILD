# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
pkgname=akonadi-vkontakte-git
pkgver=20110623
pkgrel=5
pkgdesc="VKontakte Resource for Akonadi"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/akonadi-vkontakte"
license=('GPL')
depends=('kdepimlibs>=4.6.0' 'qjson' 'boost' 'libxslt')
makedepends=('pkgconfig' 'automoc4' 'git' 'cmake')
_gitname="akonadi-vkontakte"
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
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
