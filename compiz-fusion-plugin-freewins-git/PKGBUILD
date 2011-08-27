# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=compiz-fusion-plugin-freewins-git
pkgver=20080712
pkgrel=1
pkgdesc="Compiz Fusion Freewins plugin"
arch=('i686' 'x86_64')
url="http://www.opencompositing.org"
license=('GPL')
depends=('compiz-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git')
makedepends=('git' 'intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion-git')
source=()
md5sums=()


_gitroot="git://anongit.opencompositing.org/users/warlock/freewins"
_gitname="freewins"

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

  make || return 1
  make DESTDIR=$startdir/pkg/usr/lib/compiz install || return 1

  mkdir -p ${startdir}/pkg/usr/share/compiz
  cp freewins.xml.in ${startdir}/pkg/usr/share/compiz/freewins.xml

  cd $startdir/src
  rm -rf $_gitname-build
}
