# Maintainer: Ilya Plenne aka Bkmz <libbkmz.dev "at' gmail [dot} com>
# Now only clone supports
pkgname=qutim-0.3-meta-git
pkgver=20110201
pkgrel=1
pkgdesc="Multiplatform instant messenger. ALPHA DEV Version"
arch=('i686' 'x86_64')
url="http://qutim.org/"
license=('GPL')
depends=('qt' 'openssl' 'libxss' 'wget' 'gnutls' 'zlib' 'libidn' 'libpurple' 'qca' 'cyrus-sasl' 'qca-plugin-ossl' 'qca-plugin-cyrus-sasl' )
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig')
conflicts=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn' 'qutim-git')
provides=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn')
replaces=('qutim-svn-dev' 'qutim-archangel')

md5sums=(' ')

_gitroot="git://gitorious.org/qutim/qutim-meta.git"
_gitname="qutim-meta"

build(){

if [ -d $srcdir/qutim-meta ]
then
  cd $srcdir/qutim-meta
  git pull origin master
  cd ..
else
  git clone git://gitorious.org/qutim/qutim-meta.git
fi
cd qutim-meta 
#git submodule foreach --recursive "git pull origin master"
git submodule update --init --recursive
if [ -d $srcdir/qutim-meta/build ]
then
  cd build
else
  mkdir build
  cd build
fi
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr  .. || return 1
make DESTDIR=${pkgdir} install || return 1

}

