# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdewebdev4-svn
true && pkgname=('kdewebdev4-kfilereplace-svn' 'kdewebdev4-kimagemapeditor-svn'
		 'kdewebdev4-klinkstatus-svn' 'kdewebdev4-kommander-svn')
pkgver=1242188
pkgrel=1
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'ruby' 'tidyhtml' 'kdepim4-runtime-git' 'boost' 'subversion')
groups=('kde4-git' 'kdewebdev4-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdewebdev
_svnmod=kdewebdev

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

package_kdewebdev4-kfilereplace-svn() {
        pkgdesc='Search & Replace Tool'
        depends=('kdebase4-runtime-git')
	conflicts=('kdewebdev-kfilereplace')
        url="http://kde.org/applications/utilities/kfilereplace/"
        install='kdewebdev4.install'
        cd $srcdir/build/kfilereplace
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kfilereplace
        make DESTDIR=$pkgdir install
}

package_kdewebdev4-kimagemapeditor-svn() {
        pkgdesc='HTML Image Map Editor'
        depends=('kdebase4-runtime-git')
	conflicts=('kdewebdev-kimagemapeditor')
        install='kdewebdev4.install'
        cd $srcdir/build/kimagemapeditor
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kimagemapeditor
        make DESTDIR=$pkgdir install
}

package_kdewebdev4-klinkstatus-svn() {
        pkgdesc='Link Checker'
        depends=('kdepim4-runtime-git' 'tidyhtml')
        install='kdewebdev4.install'
        cd $srcdir/build/klinkstatus
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/klinkstatus
        make DESTDIR=$pkgdir install
}
 
package_kdewebdev4-kommander-svn() {
        pkgdesc='Executor for Kommander dialogs'
        depends=('kdebase4-runtime-git')
	conflicts=('kdewebdev-kommander')
        cd $srcdir/build/kommander
        make DESTDIR=$pkgdir install
}

pkgdesc="A web development tool for KDE4"
arch=('i686' 'x86_64')
url="http://www.kde.org"