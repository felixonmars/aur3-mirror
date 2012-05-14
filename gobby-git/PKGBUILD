# Maintainer: Willow Walthall <ghthor@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gobby-git
pkgver=20120513
pkgrel=2
pkgdesc="A free collaborative editor supporting multiple documents in one session and a multi-user chat"
arch=('i686' 'x86_64')
url="http://gobby.0x539.de"
license=('GPL')
depends=('libinfinity-git' 'intltool' 'glibmm' 'gtkmm' 'gtksourceview2' 'libxml++' 'libsigc++2.0')
makedepends=('git' 'intltool')
#provides=('gobby')
conflicts=('gobby-dev')
#install=gobby-git.install
source=()
md5sums=('') 

_gitroot=git://git.0x539.de/git/gobby.git
_gitname=gobby

build() {
  cd ${srcdir}
  msg "Connecting to git.0x539.de GIT server..."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin && git checkout gobby-infinote
    cd ${srcdir}
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --branch gobby-infinote
  fi

  msg "GIT checkout done or server timeout"

  # remove any existing build folder
  if [ -d ${srcdir}/$_gitname-build ] ; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  # Create a copy to build from without the .git folder
  mkdir ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname && ls -A | grep -v .git | xargs -d '\n' cp -r -t ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  msg "Starting make..."
  ./autogen.sh --prefix=/usr || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
