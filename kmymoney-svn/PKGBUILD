# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=kmymoney-svn
pkgver=1223760
pkgrel=1
pkgdesc="A personal finance manager for KDE4."
depends=('kdelibs' 'kdebase-runtime' 'kdepimlibs' 'boost' 'alkimia')
makedepends=('subversion' 'cmake' 'automoc4' 'gettext')
conflicts=()
url=('http://kmymoney2.sourceforge.net/index-home.html')
license="GPL"
arch=('i686' 'x86_64')
 
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/office/kmymoney/
_svnmod=kmymoney
 
build() 

{

 cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_svnmod} || return 1
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=DebugFull
 
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
 

}
