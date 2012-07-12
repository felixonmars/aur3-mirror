#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=pcmanfm-fixes-git
pkgver=20120712
pkgrel=1
pkgdesc="An extremely fast, lightweight, yet feature-rich file manager with tabbed browsing"
arch=('i686' 'x86_64')
url="https://github.com/geekless/pcmanfm"
license=('GPL')
depends=('libfm-fixes-git')
makedepends=('git' 'intltool' 'pkg-config' 'automake-1.11')
optdepends=('gvfs: mounting of local and remote drives'
            'gnome-menus: applications menu and "Open with..." dialog')
provides=('pcmanfm')
conflicts=('pcmanfm' 'pcmanfm-git' 'pcmanfm_with_search')
install=pcmanfm.install

_gitroot=git://github.com/geekless/pcmanfm
_gitname=pcmanfm

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
    msg2 "Local files updated"
  else
    git clone $_gitroot $_gitname
    msg2 "Git checkout done"
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
