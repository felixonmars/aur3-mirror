# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=gedit-classbrowser
pkgver=0.3
pkgrel=3
pkgdesc='This plugin provides a generic Class Browser for gedit, the default text editor for the Gnome Desktop. It is located in the side pane and supports a wide range of languages through the use of exuberant ctags, as well as specialised parsers for python, ruby, xml/html and diff files.'

arch=('i686' 'x86_64')
provides=()
replaces=()
license=('GPL2')
url='http://www.stambouliote.de/projects/gedit_plugins.html'
depends=('gedit' 'ctags')
options=('')
source=(http://www.stambouliote.de/download/gedit_classbrowser-${pkgver}.tar.gz)
backup=()

md5sums=('d2f16dad2f1315c63171fb4298ca6dfe')

build() {
  cd ${srcdir}/gedit_classbrowser-${pkgver} || return 1

  install -D -m644 classbrowser.gedit-plugin ${pkgdir}/usr/lib/gedit-2/plugins/classbrowser.gedit-plugin || return 1

  for i in `ls classbrowser/pixmaps/`; do 
	  install -D -m644 classbrowser/pixmaps/${i} ${pkgdir}/usr/lib/gedit-2/plugins/classbrowser/pixmaps/${i} || return 1
  done;

  for i in `ls classbrowser | grep -v pixmap`; do 
	  install -D -m644 classbrowser/${i} ${pkgdir}/usr/lib/gedit-2/plugins/classbrowser/${i} || return 1
  done;

}
