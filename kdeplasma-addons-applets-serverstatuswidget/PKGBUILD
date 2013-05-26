# Maintainer: Laudivan Freire de Almeida <laudivan@gmail.com>

pkgname=kdeplasma-addons-applets-serverstatuswidget
pkgver=1.5.1
pkgrel=1
pkgdesc="A plasmoid that monitors the status of your servers via pings, TCP or unix commands."
groups='kde'
arch=(any)
url=('http://gitorious.org/serverstatuswidget')
license=('GPLv2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=()
install='serverstatuswidget.install'

_gitroot="git://gitorious.org/serverstatuswidget/serverstatuswidget.git"
_gitname="serverstatuswidget"

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname/build"
  mkdir "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release ..

  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
