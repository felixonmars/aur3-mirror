arch=(i686 x86_64)
pkgname=fsniper-git
pkgver=20081018
pkgrel=1
pkgdesc="Daemon to run scripts based on changes in files monitored by inotify"
url="http://projects.l3ib.org/fsniper/"
license="GPL3"
depends=('pcre' 'file')
makedepends=('git' 'autoconf' 'automake' 'libtool')
conflicts=()
replaces=(fsniper)
backup=()
source=()
md5sums=('')

_gitroot="git://code.l3ib.org/fsniper"
_gitname="fsniper"
build() {
  cd $startdir/src
  msg "Connecting to code.l3ib.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build
  
  ./bootstrap
  ./configure --host=${CHOST} --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  install -m644 -D ${startdir}/src/fsniper/README \
                   ${startdir}/pkg/usr/share/${pkgname}/README
  install -m644 -D ${startdir}/src/fsniper/example.conf \
                   ${startdir}/pkg/usr/share/${pkgname}/example.conf

} 
