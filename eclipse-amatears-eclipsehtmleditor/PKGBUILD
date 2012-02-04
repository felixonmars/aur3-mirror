# Contributor: Vasily Ryabov <me@ryvasy.net>
pkgname="eclipse-amatears-eclipsehtmleditor"
pkgver="2.0.6.1"
pkgrel="1"
pkgdesc="Eclipse HTML Editor is an Eclipse plugin for HTML/JSP/XML Editing."
url="http://amateras.sourceforge.jp/cgi-bin/fswiki_en/wiki.cgi?page=EclipseHTMLEditor"
license=('Eclipse public license')
arch=('i686' 'x86_64')
depends=('eclipse>=3.2', 'eclipse-gef')
source=("http://globalbase.dl.sourceforge.jp/amateras/32793/tk.eclipse.plugin.htmleditor_$pkgver.jar")
noextract=("tk.eclipse.plugin.htmleditor_$pkgver.jar")
md5sums=('49cb7a7485e07a174a90914590369b6f')

build() {
  mkdir -p ${startdir}/pkg/usr/share/eclipse/dropins/
  cp ${startdir}/src/* ${startdir}/pkg/usr/share/eclipse/dropins/
}
