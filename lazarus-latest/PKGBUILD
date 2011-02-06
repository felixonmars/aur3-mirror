# Contributor: Benedikt "linopolus" Mueller <linopolus@gmx.com>
# changed from lazarus-svn 'cause of a new svn path, out of date
# Modified by Stanislav "PoZiTPoH" Nikitin <pztrn@pozitpoh.is-a-geek.org>
pkgname=lazarus-latest
pkgver=26670
pkgrel=1
pkgdesc="Delphi-like IDE for FreePascal"
arch=('i686' 'x86_64')
url="http://www.lazarus.freepascal.org/"
license=('GPL2' 'MPL' 'custom:LGPL')
depends=('fpc' 'fpc-src' 'gdk-pixbuf')
makedepends=('imagemagick' 'subversion')
provides=(lazarus)
conflicts=(lazarus)
options=('!emptydirs' '!makeflags')
source=()
md5sums=()

_svntrunk=http://svn.freepascal.org/svn/lazarus/trunk/
_svnmod=lazarus

build() {
  mkdir -p ${startdir}/pkg/usr/share/pixmaps/
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  find -type d -name .svn -print0 | xargs -0 /bin/rm -rf > /dev/null 2>&1

  #
  # BUILD
  #
  
  # don't 'make examples' or you'll end up with a 100MB pkg
  make FPC=/usr/bin/fpc LCL_PLATFORM=gtk2 clean all || return 1
  # skip the 'make install' mess completely and do everything manually
  mkdir -p ${startdir}/pkg/usr/lib/lazarus ${startdir}/pkg/usr/bin
  rm -r debian #:)
  cp -R . ${startdir}/pkg/usr/lib/lazarus
  ln -s /usr/lib/lazarus/lazarus ${startdir}/pkg/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus ${startdir}/pkg/usr/bin/startlazarus
  ln -s /usr/lib/lazarus/lazbuild ${startdir}/pkg/usr/bin/lazbuild
  install -Dm644 install/man/man1/lazbuild.1 ${startdir}/pkg/usr/share/man/man1/lazbuild.1
  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop ${startdir}/pkg/usr/share/applications/lazarus.desktop
  #convert images/mainicon.ico ${startdir}/pkg/usr/share/pixmaps/lazarus.png
  rm -r ${startdir}/pkg/usr/lib/lazarus/install
  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt $startdir/pkg/usr/share/licenses/$pkgname/COPYING.modifiedLGPL.txt
}
