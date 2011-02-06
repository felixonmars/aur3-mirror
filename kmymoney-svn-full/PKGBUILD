# Contributor: Hei_Ku <asoliverez@gmail.com>

pkgname=kmymoney-svn-full
pkgver=1130138
pkgrel=1
pkgdesc="A personal finance manager for KDE4 with full documentation and translations included"
depends=('kdelibs' 'ruby' 'gettext' 'kdebase-runtime' 'kdepimlibs')
makedepends=('subversion' 'cmake' 'automoc4')
url=('http://kmymoney2.sourceforge.net/index-home.html')
license="GPL"
arch=('i686' 'x86_64')

_tarballver=3.98.2
_createtarball=createtarball
_createtarballmod=createtarball
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdesdk/scripts/createtarball
_svnmod=kmymoney
 
build() 

{

 cd ${srcdir}

  if [ -d ${_createtarballmod}/.svn ]; then
    (cd ${_createtarballmod} && svn revert -R .)
    (cd ${_createtarball} && svn up)
  else
    svn co ${_svntrunk} --config-dir ./ ${_createtarballmod}
  fi
  
  cd ${_createtarballmod}
  
  ${srcdir}/${_createtarballmod}/create_tarball.rb -a kmymoney -n

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_createtarballmod}/${_svnmod}-${_tarballver} || return 1
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
 
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
 

}
