# Contributor: Florian Walch <florian.walch@gmx.at>

pkgname=mwf-designer-git
pkgver=20140422
pkgrel=1
pkgdesc="Mono WinForms Designer"
arch=('i686' 'x86_64')
url="http://mono-project.com/WinForms_Designer"
license=('MIT')
depends=('mono')
build_depends=('subversion')
source=('mwf-designer'
	'mwf-designer.desktop'
	'mwf-designer-git::git://github.com/mono/mwf-designer.git')
md5sums=('ff9a6e282000a473c411a74e90d05687'
         '9071ac52577bece0661e9daa5dc33240'
	 'SKIP')

build() {
  cd "$srcdir/$pkgname"
  #mkdir -p "$srcdir/.wabi"
  #export MONO_SHARED_DIR="$srcdir/.wabi"
  make all
}
 

package() {
  cd "$srcdir"
  install -D -m755 mwf-designer $pkgdir/usr/bin/mwf-designer
  install -D -m644 mwf-designer.desktop $pkgdir/usr/share/applications/mwf-designer.desktop
  # install -D -m644 LICENSE $pkgdir/usr/share/licenses/mwf-designer-svn/LICENSE
  cd "$pkgname"
  install -D -m755 build/mwf-designer.exe $pkgdir/usr/share/mwf-designer/mwf-designer.exe
  install -D -m644 build/mwf-designer.exe.mdb $pkgdir/usr/share/mwf-designer/mwf-designer.exe.mdb
  install -D -m644 deps/*.dll $pkgdir/usr/share/mwf-designer
  # install -D -m644 deps/*.mdb $pkgdir/usr/share/mwf-designer
}