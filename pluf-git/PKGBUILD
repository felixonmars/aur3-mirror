# Contributor: Jakub Vitak <mainiak@gmail.com>
pkgname=pluf-git
pkgver=20091117
pkgrel=2
pkgdesc="PLUme Framework - for web developement"
arch=('i686' 'x86_64')
url="http://pluf.org"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=('pluf')
conflicts=()
replaces=()
backup=()
options=(!purge)
install=
source=( 'testrunner.patch' 'clean.patch' 'alternate.patch' )
noextract=()

_gitroot="git://projects.ceondo.com/pluf.git"
_gitname="pluf"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  _base="$pkgdir/srv/http"

  rm -rf $pkgdir
  mkdir -p $_base
  cp -r $srcdir/$_gitname $_base
  rm -rf $_base/$_gitname/.git
  find $pkgdir -type f -name '.gitignore' -exec rm -f {} \;

  #
  ## for disabling any feature comment patch line
  #

  cd $_base/$_gitname

  ## cleaning not -dist files - Issue 337
  patch -p1 -i $srcdir/clean.patch

  ## improving testrunner - Issue 335
  patch -p1 -i $srcdir/testrunner.patch

  ## adding alternate rows for paginator - Issue 263
  patch -p1 -i $srcdir/alternate.patch
}
md5sums=('ec82a82b4e0b00b70bb57208dd8c6b6b'
         '782c6d23cf0f369be496618c98016ba9'
         'df2a965127116648988e5d00133baaff')
