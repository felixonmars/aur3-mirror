# Maintainer : Igor Duarte Cardoso <igordcard@gmail.com>
# Forked from: git://anongit.kde.org/yakuake.
# Changed since 20140601-3: New important git commit with brand new Autostart functionality.
pkgname=yakuake-autostart-git
pkgver=20140807
pkgrel=1
pkgdesc="Yakuake is a drop-down terminal emulator based on KDE Konsole technology, now able to autostart sessions, terminals and commands!"
arch=('i686' 'x86_64')
url="https://github.com/igordcard/yakuake"
license=('GPL3')
depends=('kdebase-konsole')
makedepends=('git' 'cmake')
provides=('yakuake')
conflicts=('yakuake')
_gitroot="https://github.com/igordcard/yakuake.git"
_gitname="yakuake"
_gitbranch="autostart"

build() {
  cd "$srcdir"
  msg "Connecting to git..."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot -b $_gitbranch
  fi

  msg "Compiling..."

  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  msg "Installing..."
  cd "$srcdir/$_gitname"
  make install
}
