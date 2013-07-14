# Contributor: Michael P <ptchinster@archlinux.us>
pkgname=lanmap2-git
pkgver=20121006
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://github.com/rflynn/lanmap2"
license=('GPL')
groups=()
depends=('sqlite3' 'libpcap' 'php' 'graphviz')
makedepends=('git' 'gcc')
provides=('lanmap2')
conflicts=('lanmap2')
replaces=()
backup=()
options=()
install='lanmap2.install'
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/rflynn/lanmap2.git"
_gitname="lanmap2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  db/build-db.sh

  cd src && make 2>&1 | grep -v bit-field; cd -

  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/$_gitname-build/* ${pkgdir}/opt/${pkgname}
} 

