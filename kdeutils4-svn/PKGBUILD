# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdeutils4-svn
true && pkgname=('kdeutils4-ark-svn' 'kdeutils4-filelight-svn' 'kdeutils4-kcalc-svn' 'kdeutils4-kcharselect-svn'
		 'kdeutils4-kdf-svn' 'kdeutils4-kfloppy-svn' 'kdeutils4-kgpg-svn' 'kdeutils4-kremotecontrol-svn'
		 'kdeutils4-ktimer-svn' 'kdeutils4-kwallet-svn' 'kdeutils4-printer-applet-svn' 'kdeutils4-superkaramba-svn'
		 'kdeutils4-sweeper-svn')
pkgver=1242187
pkgrel=1
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdebase4-lib-git' 'kdebase4-workspace-git' 'pycups'
	     'kdebindings-python' 'system-config-printer-common' 'libarchive' 'qimageblitz' 'qjson' 'subversion')
groups=('kde4-git' 'kdeutils4-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeutils
_svnmod=kdeutils

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi 

  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package_kdeutils4-ark-svn() {
        pkgdesc='Archiving Tool'
        depends=('kdebase4-runtime-git' 'kdebase4-lib-git' 'libarchive')
        optdepends=('p7zip' 'zip' 'unzip' 'unrar')
	conflicts=('kdeutils-ark')
        url="http://kde.org/applications/utilities/ark/"
        cd $srcdir/build/ark
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/ark
        make DESTDIR=$pkgdir install
}
 
package_kdeutils4-filelight-svn() {
        pkgdesc='View disk usage information'
        depends=('kdebase4-runtime-git' 'qimageblitz')
	conflicts=('kdeutils-filelight')
        install='kdeutils4-svn.install'
        url="http://methylblue.com/filelight/"
        cd $srcdir/build/filelight
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/filelight
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kcalc-svn() {
        pkgdesc='Scientific Calculator'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-kcalc')
        url="http://kde.org/applications/utilities/kcalc/"
        cd $srcdir/build/kcalc
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kcalc
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kcharselect-svn() {
        pkgdesc='Character Selector'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-kcharselect')
        url="http://kde.org/applications/utilities/kcharselect/"
        cd $srcdir/build/kcharselect
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kcharselect
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kdf-svn() {
        pkgdesc='View Disk Usage'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-kdf')
        url="http://kde.org/applications/system/kdiskfree/"
        install='kdeutils4-svn.install'
        cd $srcdir/build/kdf
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kdf
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kfloppy-svn() {
        pkgdesc='Floppy Formatter'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-kfloppy')
        url="http://kde.org/applications/utilities/kfloppy/"
        install='kdeutils4-svn.install'
        cd $srcdir/build/kfloppy
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kfloppy
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kgpg-svn() {
        pkgdesc='A GnuPG frontend'
        depends=('kdepim4-runtime-git' 'kde-agent')
	conflicts=('kdeutils-kgpg')
        url="http://kde.org/applications/utilities/kgpg"
        install='kdeutils4-svn.install'
        cd $srcdir/build/kgpg
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kgpg
        make DESTDIR=$pkgdir install
}

package_kdeutils4-kremotecontrol-svn() {
        pkgdesc='Configure your remote controls for use with applications'
        depends=('kdebase4-workspace-git')
	conflicts=('kdeutils-kremotecontrol')
        url="http://kde.org/applications/utilities/kremotecontrol"
        install='kdeutils4-svn.install'
        cd $srcdir/build/kremotecontrol
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kcontrol/kremotecontrol
        make DESTDIR=$pkgdir install
}

package_kdeutils4-ktimer-svn() {
        pkgdesc='Countdown Launcher'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-ktimer')
        url="http://kde.org/applications/utilities/ktimer"
        install='kdeutils4-svn.install'
        cd $srcdir/build/ktimer
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/ktimer
        make DESTDIR=$pkgdir install
}
 
package_kdeutils4-kwallet-svn() {
        pkgdesc='Wallet Management Tool'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-kwallet')
        url="http://kde.org/applications/system/kwalletmanager/"
        install='kdeutils4-svn.install'
        cd $srcdir/build/kwallet
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kwallet
        make DESTDIR=$pkgdir install
}

package_kdeutils4-printer-applet-svn() {
        pkgdesc='System tray icon for managing print jobs'
        depends=('kdebase4-runtime-git' 'kdebindings-python' 'system-config-printer-common' 'pycups')
	conflicts=('kdeutils-printer-applet')
        url="http://kde.org/applications/system/printerapplet/"
        cd $srcdir/build/printer-applet
        make DESTDIR=$pkgdir install
        find "${pkgdir}" -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}

package_kdeutils4-superkaramba-svn() {
        pkgdesc='An engine for cool desktop eyecandy'
        depends=('kdebase4-runtime-git' 'kdebindings-python' 'qimageblitz')
	conflicts=('kdeutils-superkaramba')
        url="http://kde.org/applications/utilities/superkaramba"
        install='kdeutils4-svn.install'
        cd $srcdir/build/superkaramba
        make DESTDIR=$pkgdir install
}

package_kdeutils4-sweeper-svn() {
        pkgdesc='System Cleaner'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeutils-sweeper')
        url="http://kde.org/applications/utilities/sweeper/"
        cd $srcdir/build/sweeper
        make DESTDIR=$pkgdir install
}

arch=('i686' 'x86_64')
url="http://www.kde.org"
pkgdesc="KDE4 General Utilities"