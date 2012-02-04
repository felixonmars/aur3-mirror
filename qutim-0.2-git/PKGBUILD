# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=qutim-0.2-git
pkgver=20100105
pkgrel=1
pkgdesc="Multiplatform instant messenger - Core only. GIT version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qt' 'openssl' 'libxss')
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig')
optdepends=(
    'qutim-protocol-*: Messaging protocols support'
    'qutim-plugin-*: Additional features'
)
conflicts=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn' 'qutim-git')
provides=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn')
replaces=('qutim-svn-dev' 'qutim-archangel')

_gitroot="git://gitorious.org/qutim/qutim.git"
_gitname="qutim"

build() {
#git work
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname
  git pull origin sdk02 || return 1
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  git checkout origin/sdk02
  fi
  msg "git checkout done or server timeout"
  msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/

  msg "Building and installing..."
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make DESTDIR=${pkgdir} install || return 1

  msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_gitname}-build
}
# vim:syntax=sh