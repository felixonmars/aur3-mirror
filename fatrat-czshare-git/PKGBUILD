# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=fatrat-czshare-git
pkgver=20100630
pkgrel=1
pkgdesc='FatRat plugin for downloading and uploading on CZshare.com'
arch=(i686 x86_64)
url='http://fatrat.dolezel.info/'
license=('GPL')
makedepends=('cmake' 'git')
depends=('fatrat>=1.1')
provides=('fatrat-czshare')
conflicts=('fatrat-czshare')
groups=('fatrat-plugins-git')

_gitroot="git://dolezel.info/fatrat-czshare.git"
_gitname="fatrat-czshare"
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DWITH-NLS=ON
  make
  make DESTDIR="$pkgdir" install
}

#category: network
# vim:set ts=2 sw=2 et:
