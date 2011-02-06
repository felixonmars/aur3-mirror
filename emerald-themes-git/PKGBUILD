# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald-themes-git
pkgver=20070815
pkgrel=1
pkgdesc="Themes for emerald"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('emerald-git')
makedepends=('git' 'intltool' 'pkgconfig')
groups=('compiz-fusion-git')
conflicts=('emerald-themes')
source=()
md5sums=()


_gitroot="git://anongit.opencompositing.org/fusion/decorators/emerald-themes"
_gitname="emerald-themes"

build() {
  msg "Connecting to opencompositing.org GIT server...."
 
  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git-pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  # Remove old -build
  rm -rf $startdir/src/$_gitname-build

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
