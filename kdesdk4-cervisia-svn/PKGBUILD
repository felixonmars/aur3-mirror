# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdesdk4-svn
true && pkgname=('kdesdk4-cervisia-svn' 'kdesdk4-dolphin-plugins-svn' 'kdesdk4-kapptemplate-svn'
         'kdesdk4-kcachegrind-svn' 'kdesdk4-kdeaccounts-plugin-svn' 'kdesdk4-kdepalettes-svn'
         'kdesdk4-kioslave-svn' 'kdesdk4-kmtrace-svn' 'kdesdk4-kompare-svn' 'kdesdk4-kpartloader-svn'
         'kdesdk4-kprofilemethod-svn' 'kdesdk4-kstartperf-svn' 'kdesdk4-kuiviewer-svn' 'kdesdk4-lokalize-svn'
         'kdesdk4-okteta-svn' 'kdesdk4-poxml-svn'  'kdesdk4-scripts-svn' 'kdesdk4-strigi-analyzer-svn' 'kdesdk4-umbrello-svn')

pkgver=1242580
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'subversion' 'antlr2' 'kdepimlibs4-git' 'kdebase4-lib-git')
source=('fix-python2-path.patch')
md5sums=('61c6cb8c25c9a3ff15fb8840b1e08df9')
groups=('kde4-git' 'kdesdk4-svn')
install="kdesdk4-svn.install"

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdesdk
_svnmod=kdesdk

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

  cp -r ${srcdir}/$_svnmod ${srcdir}/build
  cd ${srcdir}/build
  patch -Np1 -i ${srcdir}/fix-python2-path.patch
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
                -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
                $(find . -name '*.py')
  
  cmake . -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package_kdesdk4-cervisia-svn() {
        pkgdesc='CVS Frontend'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-cervisia')
        url="http://kde.org/applications/development/cervisia/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/cervisia
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/cervisia
        make DESTDIR=$pkgdir install
}

package_kdesdk4-dolphin-plugins-svn() {
        pkgdesc='Extra Dolphin plugins'
        depends=('kdebase4-dolphin-git' 'subversion' 'git' 'kdesdk4-kompare-svn')
	conflicts=('kdesdk-dolphin-plugins')
        install='kdesdk4-svn.install'
        cd $srcdir/build/dolphin-plugins/git
        make DESTDIR=$pkgdir install
        cd $srcdir/build/dolphin-plugins/svn
        make DESTDIR=$pkgdir install
}
 
package_kdesdk4-kapptemplate-svn() {
        pkgdesc='KDE Template Generator'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kapptemplate')
        url="http://kde.org/applications/development/kapptemplate/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/kapptemplate
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kapptemplate
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kcachegrind-svn() {
        pkgdesc='Visualization of Performance Profiling Data'
        depends=('kdebase4-runtime-git' 'python2')
        optdepends=('php: PHP support')
	conflicts=('kdesdk-kcachegrind')
        url="http://kde.org/applications/development/kcachegrind/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/kcachegrind
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kcachegrind
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kdeaccounts-plugin-svn() {
        pkgdesc='KDE Repository Accounts'
        depends=('kdepim4-runtime-git')
	conflicts=('kdesdk-kdeaccounts-plugin')
        cd $srcdir/build/kdeaccounts-plugin
        make DESTDIR=$pkgdir install
}
 
package_kdesdk4-kdepalettes-svn() {
        pkgdesc='Palettes for the Gimp that match the KDE standard color palette'
        optdepends=('gimp')
	conflicts=('kdesdk-kdepalettes')
        install -D -m644 $srcdir/kdesdk/kdepalettes/KDE_Gimp \
                $pkgdir/usr/share/gimp/2.0/palettes/KDE.gpl
}

package_kdesdk4-kioslave-svn() {
        pkgdesc='KDED Subversion Module'
        depends=('kdebase4-runtime-git' 'subversion')
	conflicts=('kdesdk-kioslave')
        cd $srcdir/build/kioslave
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kmtrace-svn() {
        pkgdesc='A KDE tool to assist with malloc debugging using glibc´s "mtrace" functionality'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kmtrace')
        cd $srcdir/build/kmtrace
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kmtrace
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kompare-svn() {
        pkgdesc='Diff/Patch Frontend'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kompare')
        url="http://kde.org/applications/development/kompare/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/kompare
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kompare
        make DESTDIR=$pkgdir install
}
package_kdesdk4-kpartloader-svn() {
        pkgdesc='A test application for KParts'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kpartloader')
        install='kdesdk4-svn.install'
        cd $srcdir/build/kpartloader
        make DESTDIR=$pkgdir install
}
 
package_kdesdk4-kprofilemethod-svn() {
        pkgdesc='Macros helping to profile'
	conflicts=('kdesdk-kprofilemethod')
        cd $srcdir/build/kprofilemethod
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kstartperf-svn() {
        pkgdesc='Startup time measurement tool for KDE applications'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kstartperf')
        cd $srcdir/build/kstartperf
        make DESTDIR=$pkgdir install
}

package_kdesdk4-kuiviewer-svn() {
        pkgdesc='Qt Designer UI File Viewer'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-kuiviewer')
        url="http://kde.org/applications/development/kuiviewer/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/kuiviewer
        make DESTDIR=$pkgdir install
}

package_kdesdk4-lokalize-svn() {
        pkgdesc='Computer-Aided Translation System'
        depends=('kdebase4-runtime-git' 'kdebindings-python')
	conflicts=('kdesdk-lokalize')
        url="http://kde.org/applications/development/lokalize/"
        optdepends=('translate-toolkit: enable extra python script')
        install='kdesdk4-svn.install'
        cd $srcdir/build/lokalize
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/lokalize
        make DESTDIR=$pkgdir install
}

package_kdesdk4-okteta-svn() {
        pkgdesc='Hex Editor'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-okteta')
        url="http://kde.org/applications/utilities/okteta"
        install='kdesdk4-svn.install'
        cd $srcdir/build/okteta
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/okteta
        make DESTDIR=$pkgdir install
}
 
package_kdesdk4-poxml-svn() {
        pkgdesc='Translates DocBook XML files using gettext po files'
        depends=('qt' 'antlr2')
	conflicts=('kdesdk-poxml')
        cd $srcdir/build/poxml
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/poxml
        make DESTDIR=$pkgdir install
}

package_kdesdk4-scripts-svn() {
        pkgdesc='KDE SDK scripts'
        depends=('python2')
	conflicts=('kdesdk-scripts')
        cd $srcdir/build/scripts
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/scripts
        make DESTDIR=$pkgdir install
}

package_kdesdk4-strigi-analyzer-svn() {
        pkgdesc='Strigi-Analyzer for KDE SDK'
        depends=('kdelibs4-git')
	conflicts=('kdesdk-strigi-analyzer')
        cd $srcdir/build/strigi-analyzer
        make DESTDIR=$pkgdir install
}

package_kdesdk4-umbrello-svn() {
        pkgdesc='UML Modeller'
        depends=('kdebase4-runtime-git')
	conflicts=('kdesdk-umbrello')
        url="http://kde.org/applications/development/umbrello/"
        install='kdesdk4-svn.install'
        cd $srcdir/build/umbrello
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/umbrello
        make DESTDIR=$pkgdir install
}

url="http://www.kde.org"
pkgdesc="KDE4 Software Development Kit"
