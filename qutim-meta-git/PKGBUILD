# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=qutim-meta-git
pkgver=20100401
pkgrel=1
pkgdesc="Multiplatform instant messenger - Core only. SVN version"                                                                                         
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qt' 'openssl' 'libxss')
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig')
optdepends=(
    'qutim-protocol-*: Messaging protocols support'
    'qutim-plugin-*: Additional features'
)
conflicts=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn')
provides=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn')
replaces=('qutim-svn-dev' 'qutim-archangel')

_gitroot="git://gitorious.org/qutim/qutim-meta.git"
_gitname="qutim-meta"

build() {
#git work
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname 
  git pull origin master || return 1
  git submodule update --init
  git submodule foreach 'git submodule update --init'
  cd core || return 1
  git submodule update --init
  cd $srcdir/$_gitname || return 1
  cd protocols || return 1
  git submodule update || return 1
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  git pull origin master || return 1
  git submodule update --init || return 1
  git submodule foreach `git submodule update --init` || return 1
  cd core || return 1
  git submodule update --init || return 1
  fi
  msg "git checkout done or server timeout"
msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/
  git submodule update --init || return 1
  git submodule foreach `git submodule update --init` || return 1
msg "Building and installing..."
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  sed -i "s/-Werror/ /g" $srcdir/$_gitname-build/protocols/quetzal/CMakeFiles/quetzal.dir/build.make
  make DESTDIR=${pkgdir} install || return 1

msg "Copying cmake rules"
    mkdir -p ${pkgdir}/usr/share/cmake-2.8/Modules/
    cp -r $srcdir/$_gitname-build/core/cmake/*.cmake ${pkgdir}/usr/share/cmake-2.8/Modules/

msg "Removing build directory..."
  cd ${srcdir}
  rm -rf ${_gitname}-build
}
# vim:syntax=sh
