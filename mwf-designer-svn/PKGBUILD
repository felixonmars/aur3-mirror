# Contributor: Florian Walch <florian.walch@gmx.at>

pkgname=mwf-designer-svn
pkgver=114613
pkgrel=1
pkgdesc="Mono WinForms Designer"
arch=('i686' 'x86_64')
url="http://mono-project.com/WinForms_Designer"
license=('MIT')
depends=('mono')
build_depends=('subversion')
source=('mwf-designer' 'mwf-designer.desktop')
md5sums=('ff9a6e282000a473c411a74e90d05687'
         '9071ac52577bece0661e9daa5dc33240')

_svntrunk=svn://anonsvn.mono-project.com/source/trunk/mwf-designer
_svnmod=mwf-designer-svn

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir $srcdir/.wabi
  make mono-design || return 1
  install -D -m755 $srcdir/mwf-designer $pkgdir/usr/bin/mwf-designer
  install -D -m755 $srcdir/$_svnmod/build/mwf-designer.exe $pkgdir/usr/share/mwf-designer/mwf-designer.exe
  install -D -m644 $srcdir/$_svnmod/build/mwf-designer.exe.mdb $pkgdir/usr/share/mwf-designer/mwf-designer.exe.mdb
  install -D -m644 $srcdir/$_svnmod/deps/*.dll $pkgdir/usr/share/mwf-designer
  install -D -m644 $srcdir/$_svnmod/deps/*.mdb $pkgdir/usr/share/mwf-designer
  install -D -m644  $srcdir/mwf-designer.desktop $pkgdir/usr/share/applications/mwf-designer.desktop
  install -D -m644 $srcdir/$_svnmod/LICENSE $pkgdir/usr/share/licenses/mwf-designer-svn/LICENSE
}
