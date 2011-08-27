# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=simpmd-svn
pkgver=55
pkgrel=1
pkgdesc="Full emulator of PMD85 (svn)"
arch=('i686' 'x86_64')
url="http://dsrg.mff.cuni.cz/~ceres/prj/SimPMD/"
license=('apache')
depends=('sdl' 'python' 'popt' 'doxygen')
source=('simpmd.desktop')
md5sums=('8fba184b70c9eea6cbe63a9b567fd8b7')

_svntrunk="http://shiva.ms.mff.cuni.cz/svn/simpmd/trunk"
_svnmod="simpmd"

build() {
        cd $srcdir

        # get the sources
        msg "Connecting to $_svntrunk ..."
        if [ -d $_svnmod/.svn ]; then
                (cd $_svnmod && svn up) || return 1
        else
                svn co $_svntrunk $_svnmod || return 1
        fi
        msg "SVN checkout done or server timeout"

  install -D -m644 $srcdir/simpmd.desktop $pkgdir/usr/share/applications/simpmd.desktop

  cd $srcdir/simpmd
  mkdir -p $pkgdir/usr/share/{doc/simpmd-${pkgver},simpmd}
  make PMD_BUILD=RELEASE PMD_SHARE=/usr/share/simpmd/
  chmod 755 data/monitors/M{1,2,2-Patched-Tape}
  #cd data/
  #ln -s monitors/M1 ./M1
  #ln -s monitors/M2-Patched-Tape ./M2
  #cd ..
}

package() {
  cd $srcdir/simpmd
  install -D -m755 bin/simpmd $pkgdir/usr/bin/simpmd
  install -D -m755 bin/ptp2raw $pkgdir/usr/bin/ptp2raw
  rm Makefile
  install -D -m644 * $pkgdir/usr/share/doc/simpmd-${pkgver} || true
  cd $srcdir/simpmd/data
  /bin/tar cf - --exclude=.svn * | ( cd ../../../pkg/usr/share/simpmd/; tar xfp - )
}
