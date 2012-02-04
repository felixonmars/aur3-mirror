# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: laloch <laloch@atlas.cz>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-kde-accounts-kcm-plugins-git
pkgver=20110909
pkgrel=1
pkgdesc="Plugins for protocol-specific UI's in the Telepathy Accounts KCM"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/telepathy/telepathy-accounts-kcm/telepathy-accounts-kcm-plugins"
license=('GPL')
depends=('telepathy-kde-accounts-kcm-git')
makedepends=('cmake' 'automoc4' 'git')
optdepends=('telepathy-gabble: XMPP/Jabber/GTalk support'
            'telepathy-butterfly: MSN/Windows Live support'
            'telepathy-haze: all protocols supported by libpurple')
conflicts=('telepathy-kde-accounts-kcm-plugins'
            'telepathy-accounts-kcm-plugins-git')

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

