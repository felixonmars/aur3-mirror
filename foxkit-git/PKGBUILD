# Contributor: TDY <tdy@archlinux.info>
# Contributor: adriano <adriano.src@gmail.com>

pkgname=foxkit-git
pkgver=20090117
pkgrel=1
pkgdesc="A QtWebKit web browser"
arch=('i686')
url="http://code.google.com/p/foxkit/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake' 'git')
provides=('foxkit')
conflicts=('foxkit')

_gitroot=git://gitorious.org/foxkit/mainline.git
_gitname=mainline

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [ -d "$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=/usr/lib/qt4/bin/qmake \
        -DCMAKE_BUILD_TYPE=RELEASE .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 src/foxkitui.rc "$pkgdir/opt/kde/share/apps/foxkit/foxkitui.rc"
}

# vim:set ts=2 sw=2 et:
