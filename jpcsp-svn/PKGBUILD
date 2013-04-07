# Maintainer: Bug <bug2000@gmail.com>
# Contributor: Bug <bug2000@gmail.com>
pkgname=jpcsp-svn
pkgver=3090
pkgrel=1
pkgdesc="JAVA PSP Emulator"
arch=('i686' 'x86_64')
url="http://jpcsp.org/"
license=('GPL')
depends=(jogl)
makedepends=('subversion' 'apache-ant')
provides=('jpcsp')
conflicts=('jpcsp')
install=jpcsp.install
source=(
    'jpcsp-read-only::svn+http://jpcsp.googlecode.com/svn/trunk'
    'jpcsp.sh'
    'jpcsp.desktop'
)
md5sums=(SKIP
         'd2551a7c28d10151caf535d8a035124f'
         'cd39aad03798576eb5228ed4184885c8')
_svnmod=jpcsp-read-only

pkgver() {
    LANG=C svn info "$SRCDEST/$_svnmod" | awk '/Last Changed Rev/ {print $4}'
  }

build() {
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  mv build.xml build-bkp.xml
  mv build-auto.xml build.xml
  /usr/bin/ant jar
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p $pkgdir/opt/jpcsp/lib
  rm -R bin/class
  cp -a bin $pkgdir/opt/jpcsp/
  rm -R lib/{macosx,macosx-64,windows-x86,windows-amd64}
  if [ $CARCH == x86_64 ] ; then
    rm -R lib/linux-x86
    cp lib/linux-amd64/liblwjgl64.so lib/linux-amd64/liblwjgl.so
  else #32bit
    rm -R lib/linux-amd64
  fi
   
  cp -a lib/ $pkgdir/opt/jpcsp/
  install -D ../../jpcsp.sh $pkgdir/usr/bin/jpcsp
  install -D ../../jpcsp.desktop $pkgdir/usr/share/applications/jpcsp.desktop
}

# vim:set ts=2 sw=2 et:
