# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributer: Brendan Taylor <whateley@gmail.com>
# Contributer: L42y <423300@gmail.com>
pkgname=uzbl-experimental-git
pkgver=20110415
pkgrel=1
pkgdesc="All uzbl web interface tools: latest from the git experimental branch"
arch=('i686' 'x86_64')
url="http://github.com/Dieterbe/uzbl/"
license=('GPL3')
depends=('libwebkit' 'socat' 'zenity' 'xclip' 'dmenu' 'python2' 'pygtk')
makedepends=('git' 'pkgconfig' 'libwebkit>=1.2.0')
provides=('uzbl-core' 'uzbl-browser' 'uzbl-tabbed')
conflicts=('uzbl-core' 'uzbl-browser' 'uzbl-tabbed' 'uzbl-git')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/uzbl.git"
_gitname="experimental"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin experimental
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname && git checkout origin/experimental
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # python2 fix
  # thanks Brendan Taylor
  # for file in examples/data/scripts/uzbl*; do
  for file in bin/*; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find ./ -name '*.py')

  make
}

package() {
   cd "$srcdir/$_gitname-build"
   make DESTDIR="$pkgdir" PREFIX=/usr  install
}
