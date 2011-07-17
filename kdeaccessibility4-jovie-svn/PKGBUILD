# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdeaccessibility4-svn
true && pkgname=('kdeaccessibility4-jovie-svn' 'kdeaccessibility4-kaccessible-svn' 'kdeaccessibility4-kmag-svn'
		 'kdeaccessibility4-kmousetool-svn' 'kdeaccessibility-kmouth-svn')
pkgver=1241617
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion' 'cmake' 'automoc4' 'kdebase4-runtime-git' 'speech-dispatcher')
conflicts=('kdeaccessibility')
groups=('kde4-git' 'kdeaccessibility4-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeaccessibility
_svnmod=kdeaccessibility

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

package_kdeaccessibility4-jovie-svn() {
        pkgdesc='A text to speech application'
        depends=('kdebase4-runtime-git' 'speech-dispatcher')
	conflicts=('kdeaccessibility-jovie')
        install='kdeaccessibility4-svn.install'
        cd $srcdir/build/jovie
        make DESTDIR=$pkgdir install
}

package_kdeaccessibility4-kaccessible-svn() {
	pkgdesc='Provides accessibility services like focus tracking and a screenreader'
	depends=('kdebase4-runtime-git' 'speech-dispatcher')
	conflicts=('kdeaccessibility-kaccessible')
        install='kdeaccessibility4-svn.install'
	cd $srcdir/build/kaccessible
	make DESTDIR=$pkgdir install
}

package_kdeaccessibility4-kmag-svn() {
        pkgdesc='Screen Magnifier'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeaccessibility-kmag')
        url="http://kde.org/applications/utilities/kmag/"
        install='kdeaccessibility4-svn.install'
        cd $srcdir/build/kmag
        make DESTDIR=$pkgdir install
}

package_kdeaccessibility4-kmousetool-svn() {
        pkgdesc='Clicks the mouse for you, reducing the effects of RSI'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeaccessibility-kmousetoo')
        url="http://kde.org/applications/utilities/kmousetool/"
        install='kdeaccessibility4-svn.install'
        cd $srcdir/build/kmousetool
        make DESTDIR=$pkgdir install
}

package_kdeaccessibility-kmouth-svn() {
        pkgdesc='Speech Synthesizer Frontend'
        depends=('kdebase4-runtime-git')
	conflicts=('kdeaccessibility-kmout')
        url="http://kde.org/applications/utilities/kmouth/"
        install='kdeaccessibility4-svn.install'
        cd $srcdir/build/kmouth
        make DESTDIR=$pkgdir install
}
url='http://accessibility.kde.org'
pkgdesc="KDE 4 Accessibility Aids"