pkgname=eskiss-svn
pkgver=49684
pkgrel=1
pkgdesc="A small game written using efl. It's a physics game like Crayon Physics or Numpty Physics"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org"
license=('BSD')
depends=('edje-svn' 'chipmunk' 'evas-svn' 'embryo-svn' 'ecore-svn' 'eet-svn')
makedepends=('svn')
conflicts=('eskiss')
provides=('eskiss')
replaces=('eskiss-cvs')
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/MISC/eskiss"
_svnmod="eskiss"

build() {
   cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./waf configure --prefix=/usr || return 1
  ./waf || return 1
  ./waf install --destdir=$pkgdir || return 1

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
    $pkgdir/usr/share/licenses/$pkgname/COPYING

  install -Dm644 $srcdir/$_svnmod-build/COPYING-PLAIN \
    $pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN

install -d $pkgdir/usr/share/{applications,icons}
cp $pkgdir/usr/share/eskiss/brushes/ball_01.png $pkgdir/usr/share/icons/eskiss.png
echo "[Desktop Entry]
Name=Eskiss
Comment=A small game written using efl. It's a physics game like Crayon Physics or Numpty Physics
Exec=eskiss -F=1
Icon=/usr/share/icons/eskiss.png
Terminal=false
Type=Application
Categories=Game;

" > $pkgdir/usr/share/applications/eskiss.desktop

  rm -r $srcdir/$_svnmod-build
}
