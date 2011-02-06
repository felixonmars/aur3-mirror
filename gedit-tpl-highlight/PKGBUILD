

pkgname=gedit-tpl-highlight
pkgver=0.1.0
pkgrel=1
pkgdesc="template HTML Colored HighLight support in gedit"
arch=(i686 x86_64)
license=('GPL')
url="http://forum.ubuntu-fr.org/viewtopic.php?id=2955"
depends=('gedit' 'shared-mime-info' 'gtksourceview2' )
install=gedit-tpl-highlight.install
source=('tpl.xml')
md5sums=('d29bb669025f5705412d092b6e88a6b3')


build() {
  cd "${srcdir}/" || return 1
  mkdir -p $startdir/pkg/usr/share/mime/packages || return 1
  cp tpl.xml $startdir/pkg/usr/share/mime/packages || return 1

}


