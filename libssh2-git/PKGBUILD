# Archlive <http://archlive-pkg.googlecode.com>

pkgname=libssh2-git
pkgver=20091023
pkgrel=1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts"
url="http://www.libssh2.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl')
makedepends=('zlib')
provides=(libssh2 libssh2=1.2.2)
conflicts=(libssh2)
options=('!libtool')
source=('FindLibSSH2.cmake')

_gitroot='git://git.libssh2.org/libssh2.git'
_gitname='libssh2'

build() {

  cd $startdir

  msg "Connecting to git.libssh.org GIT server...."

  if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot $_gitname
  fi

  [ -d $srcdir/$_gitname-build ] && rm -rf $srcdir/$_gitname-build
  git clone $startdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build
  ./buildconf
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  install -Dm644 ${srcdir}/FindLibSSH2.cmake \
    ${pkgdir}/usr/share/cmake-2.6/Modules/FindLibSSH2.cmake
}
