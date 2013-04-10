pkgname=fusecompress-1
pkgver=0.9.1.1
pkgrel=1
pkgdesc="Mountable filesystem which transparently compresses its content. C-implementation 0.x"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fusecompress/"
license=('GPL')
groups=()
depends=('fuse' 'zlib' 'bzip2' 'xz' 'lzo2')
makedepends=('svn')
provides=()
conflicts=()
replaces=()
backup=()
source=()
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_svnrepo='fusecompress'
_svnroot='http://fusecompress.googlecode.com/svn/trunk/'

build() {
  cd "$srcdir"
  export CXXFLAGS="-O2"
  if [ -d $_svnrepo ]; then
    cd $_svnrepo
    svn update || return 1
    msg2 "The local files have been updated"
  else
    svn checkout $_svnroot $_svnrepo || return 1
    msg2 "SVN checkout done"
	cd $_svnrepo
  fi

  sed -i "s+AM_CONFIG_HEADER(config.h)+AC_CONFIG_HEADERS([config.h])+" "$srcdir/$_svnrepo/configure.ac"

  sh autogen.sh || exit 1
  ./configure --prefix=/usr || exit 1
  make || exit 1
  make DESTDIR="${pkgdir}" install || exit 1
}
