# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=qconnman-ui-git
pkgver=r93.gb54504d
pkgrel=1
epoch=2
pkgdesc="A Qt ConnMan management interface"
arch=('i686' 'x86_64')
url="https://github.com/OSSystems/qconnman-ui"
license=('LGPL')
depends=('qconnman-git')
makedepends=('git')

source=('qconnman-ui.desktop'
        'git+https://github.com/OSSystems/qconnman-ui.git')
        
md5sums=('b762ac3e79c57411ce94eb3eca7fa0e8'
         'SKIP')

pkgver() {
  cd "$srcdir"/qconnman-ui
  local r=$(git rev-list --count HEAD)
  local h=$(git rev-parse --short HEAD)
  echo "r$r.g$h"
}

build() {
  cd "$srcdir"/qconnman-ui
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/qconnman-ui
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 "$srcdir"/qconnman-ui.desktop "$pkgdir"/usr/share/applications/qconnman-ui.desktop
}
