# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-accounts-kcm-plugins-git
pkgver=20110802
pkgrel=1
pkgdesc="Plugins for protocol-specific UI's in the Telepathy Accounts KCM"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'telepathy-accounts-kcm-git')
makedepends=('cmake' 'automoc4' 'git')
optdepends=('telepathy-gabble: XMPP/Jabber/GTalk support'
            'telepathy-butterfly: MSN/Windows Live support'
            'telepathy-haze: all protocols supported by libpurple')
conflicts=('telepathy-kde-accounts-kcm-plugins')

_gitroot="git://anongit.kde.org/telepathy-accounts-kcm-plugins.git"
_gitname="telepathy-accounts-kcm-plugins"

build() {
  cd ${srcdir}

  msg "Connecting to the GIT server...."
  
  if [[ -d ${srcdir}/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf ${srcdir}/build && mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
}

