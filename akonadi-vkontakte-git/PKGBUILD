# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
pkgname=akonadi-vkontakte-git
pkgver=20110623
pkgrel=2
pkgdesc="Akonadi plugin for Vkontakte, git version"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Faspotashev%2Fakonadi-vkontakte.git&a=summary"
license=('GPL')
depends=('kdelibs' 'akonadi' 'qjson' 'boost' 'libxslt')
makedepends=('pkgconfig' 'automoc4' 'git' 'cmake')
_gitroot='git://anongit.kde.org/scratch/aspotashev/akonadi-vkontakte.git'
_gitname='akonadi-vkontakte'

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
