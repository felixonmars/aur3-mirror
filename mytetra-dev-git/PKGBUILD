# Contributor: m0rph < m0rph.mailbox (at) gmail.com >

pkgname=mytetra-dev-git
pkgver=20130113
pkgrel=1
pkgdesc='Smart manager for information collecting'
arch=('i686' 'x86_64')
url='http://webhamster.ru/site/page/index/articles/projectcode/105'
license=('GPL3')
depends=('qt')
makedepends=('make' 'git')

_gitroot="git://github.com/xintrea/mytetra_dev.git"
_gitname="mytetra"


build() {
cd "${srcdir}" || return 1

  if [[ -d $_gitname ]]; then
     (cd $_gitname && git pull origin)
     else
     git clone $_gitroot $_gitname
  fi
cd mytetra
sed -i "1i#include <unistd.h>" src/qtsingleapplication/qtlocalpeer.cpp
# Change install dir to /usr/bin
sed -i -e "s|BINARY_INSTALL_PATH=/usr/local/bin|BINARY_INSTALL_PATH=/usr/bin|" mytetra.pro
BINARY_INSTALL_PATH=/usr/bin

qmake || return 1

msg "Starting make..."
make #CXXFLAGS="-fpermissive" || return 1
msg "Installing to package directory..."
make INSTALL_ROOT="${pkgdir}" install || return 1
}
