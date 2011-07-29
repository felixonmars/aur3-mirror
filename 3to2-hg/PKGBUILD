#Maintainer: Jarek jarek@eden.rutgers.edu
pkgname=3to2-hg
pkgver=1.0
pkgrel=1
pkgdesc="Script to convert python3 code to python2. Counterpart to 2to3. This is the latest dev version"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.startcodon.com/wordpress/?cat=8')
depends=('python2')
makedepends=('mercurial' 'python')
source=('Makefile.patch')
noextract=()
md5sums=('7e9281f41d52220c5a592a5ed696fb38')
conflicts=('3to2')

merc_root='https://bitbucket.org/amentajo/lib3to2'
merc_repo='lib3to2'

build() {
  msg "Connecting to Mercurial server...."

  if [ -d $merc_repo ] ; then
    cd $merc_repo
    hg pull -u
    msg "The local files are updated."
  else
    msg "hg clone $merc_root $merc_repo" 
    hg clone $merc_root $merc_repo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$merc_repo-build"
  cp -r "$srcdir/$merc_repo" "$srcdir/$merc_repo-build"
  cd "$srcdir/$merc_repo-build"
}

package() {
  cd "$srcdir/$merc_repo-build"
  msg "Starting build"
  make  DESTDIR=$pkgdir python2
  msg "Patching Makefile"
  patch -p0 < ../Makefile.patch
  msg "make DESTDIR=$pkgdir install"
  make DESTDIR=$pkgdir install

} 
