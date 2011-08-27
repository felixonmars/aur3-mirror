pkgname=ptk
pkgver=361
pkgrel=1
pkgdesc="Protrekkr - tracker, sequencer"
arch=('i686')
url="http://code.google.com/p/protrekkr/"
license=('New BSD')
groups=('')
depends=('alsa-oss')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=http://protrekkr.googlecode.com/svn/trunk/
_svnmod=ptk
#install=ptk.install
build() {
    svn co $_svntrunk $pkgname --config-dir ./ $pkver
    msg "SVN checkout done or sever timeout"
    msg "Starting make..."
    cd $srcdir/ptk/src/extralibs/tinyxml ;  make
    cd $srcdir/ptk/src/extralibs/sdl_draw ; make -f makefile.linux
    cd $srcdir/ptk
    echo "src dir".$srcdir
    patch -p0 -i $startdir/ptk1.98k-makefile.patch $srcdir/ptk/makefile.linux
    make -f makefile.linux || return 1
    mkdir  -p $pkgdir/usr/share/ptk $pkgdir/usr/bin
    ln -s /usr/share/ptk/ptk_linux $pkgdir/usr/bin/ptk-oss
    echo '#!/bin/bash
aoss /usr/share/ptk/ptk_linux' > $pkgdir/usr/bin/ptk-alsa
    chmod 755 $pkgdir/usr/bin/ptk-alsa 
    ln -s /usr/bin/ptk-alsa $pkgdir/usr/bin/ptk
    cp -r $srcdir/ptk/release/distrib/*  $pkgdir/usr/share/ptk 
}
