# Contributor: kasa <biuta.jr@gmail.com>

pkgname=compizconfig-backend-gconf-git
pkgver=20070815
pkgrel=1
pkgdesc="Compizconfig backend for gconf"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('libcompizconfig-git')
makedepends=('git' 'intltool' 'pkgconfig')
groups=('compiz-fusion-git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://anongit.opencompositing.org/fusion/compizconfig/compizconfig-backend-gconf"
_gitname="compizconfig-backend-gconf"

build() {
  msg "Connecting to opencompositing.org GIT server...."
 
  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  ACLOCAL="aclocal -I /usr/share/aclocal" ./autogen.sh --host=${CHOST} \
    --prefix=/usr \
    --infodir=/usr/share/info \
    --mandir=/usr/man \
    --sysconfdir=/etc || return 1

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  cd $startdir/src
  rm -rf $_gitname-build
}
