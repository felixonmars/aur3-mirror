# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=fatrat-subtitlesearch-git
pkgver=20100928
pkgrel=1
pkgdesc='FatRat plugin for downloading subtitles from OpenSubtitles.com (by movie hash)'
arch=(i686 x86_64)
url='http://fatrat.dolezel.info/'
license=('GPL')
makedepends=('cmake' 'git')
depends=('fatrat>=1.1' 'zlib')
provides=('fatrat-opensubtitles')
conflicts=('fatrat-opensubtitles')
groups=('fatrat-plugins-git')
replaces=('fatrat-opensubtitles-git')

_gitroot="git://dolezel.info/fatrat-subtitlesearch.git"
_gitname="fatrat-subtitlesearch"
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

  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DWITH_NLS=ON
  make
  make DESTDIR="$pkgdir" install
}

#category: network
# vim:set ts=2 sw=2 et:
