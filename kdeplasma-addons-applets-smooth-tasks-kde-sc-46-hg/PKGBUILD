# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=kdeplasma-addons-applets-smooth-tasks-kde-sc-46-hg
pkgver=401
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="A taskbar replacement Plasmoid with window peeking similar to Windows 7. Compatible with KDE SC 4.6."
url="https://bitbucket.org/jimi312/smooth-tasks-kde-sc-4.6"
license=('GPLv2')
groups=(kde)
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'mercurial' 'coreutils' 'perl')
provides=(smooth-tasks)
conflicts=(smooth-tasks)
install=plasmoid.install
md5sums=()

_hgroot="http://bitbucket.org/jimi312"
_hgrepo="smooth-tasks-kde-sc-4.6"


build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  
  # Compile the plasmoid
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="${pkgdir}" install || return 1
}
