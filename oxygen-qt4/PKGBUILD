pkgname=oxygen-qt4
pkgver=4.11.13 # Version taken from i686 kdebase-workspace
pkgrel=1
pkgdesc='Libs needed for Qt4 apps to use Oxygen KDE Style (in case when kdebase-workspace cannot be installed)'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
url='https://projects.kde.org/projects/kde/kde-workspace'
depends=('acl')
source=("https://www.archlinux.org/packages/extra/$CARCH/kdebase-workspace/download/#kdebase-workspace-$CARCH.pkg.tar.xz"
	"https://www.archlinux.org/packages/extra/$CARCH/kdelibs/download/#kdelibs-$CARCH.pkg.tar.xz"
	"https://www.archlinux.org/packages/extra/$CARCH/attica-qt4/download/#attica-qt4-$CARCH.pkg.tar.xz"
	"https://www.archlinux.org/packages/extra/$CARCH/libdbusmenu-qt/download/#libdbusmenu-qt-$CARCH.pkg.tar.xz"
	"https://www.archlinux.org/packages/extra/$CARCH/strigi/download/#strigi-$CARCH.pkg.tar.xz")

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

build() {
  true
}

package() {
  mkdir -p $pkgdir/usr/lib/kde4/plugins/styles/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/kde4/plugins/styles/oxygen.so $pkgdir/usr/lib/kde4/plugins/styles/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libkdeui.so.5* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libkio.so.5* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/liboxygenstyle.so.4* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libkdecore.so.5* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libattica.so.0.4* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libdbusmenu-qt.so.2* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libstreamanalyzer.so.0* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libsolid.so.4* $pkgdir/usr/lib/
  cp --preserve=mode,ownership,timestamps,links $srcdir/usr/lib/libstreams.so.0* $pkgdir/usr/lib/
}
