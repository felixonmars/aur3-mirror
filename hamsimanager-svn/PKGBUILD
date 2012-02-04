
# Maintainer: J.W. Birdsong <jwbirdsongATgmailDOTcom>
pkgname=hamsimanager-svn
pkgver=222
pkgrel=1
pkgdesc="Hamsi Manager is a file manager,renamer,id3 tagger,information changer , tool."
arch=('i686' 'x86_64')
url="http://hamsimanager.sourceforge.net"
license=('GPL3')
depends=('qt' 'python2-qt' 'python2' 'mplayer')
makedepends=('subversion')
optdepends=('KDE'  'phonon:optional music player')
provides=(hamsimanager)
conflicts=(hamsimanager)
source=(HamsiManager.desktop hamsi.launcher)

md5sums=('603bd4ad05a3f2591424cd218950a6d6'
         'ec4a30c4c399cd72f42b2975ab5c5314')

_svntrunk=https://hamsimanager.svn.sourceforge.net/svnroot/hamsimanager/trunk
_svnmod=hamsimanager

package () {
cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" $srcdir/$_svnmod-build/HamsiManager.py

install -d $pkgdir/{usr/bin/,usr/share/hamsi/}

 mv $srcdir/$_svnmod-build/*  $pkgdir/usr/share/hamsi
 # Install Desktop File
    install -D -m644 $srcdir/HamsiManager.desktop \
        $pkgdir/usr/share/applications/HamsiManager.desktop
# Install the Launcher
    install -D -m755 $srcdir/hamsi.launcher \
        $pkgdir/usr/bin/hamsi
}
# vim:set ts=2 sw=2 et:

