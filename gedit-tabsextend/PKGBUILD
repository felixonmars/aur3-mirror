# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=gedit-tabsextend
pkgver=0.1
pkgrel=3
pkgdesc='Features: Middle button mouse close tabs, Undo close tab (Ctrl+Shift+T), Close others tabs, unless current (Ctrl+Shift+O), Tabs menus for features:, Close all, Close others, Undo close'

arch=('i686' 'x86_64')
provides=()
replaces=()
license=('GPL2')
url='http://code.google.com/p/gedit-tabsextend'
depends=('gedit')
options=('')
source=(http://gedit-tabsextend.googlecode.com/files/gedit-tabsextend-${pkgver}.tar.gz)
backup=()

md5sums=('e0b72276070a15d7b26403d6ca609c09')

build() {
  tar -xvf gedit-tabsextend-${pkgver}.tar.gz || return 1
  cd ${srcdir}/nuxlli-gedit-tabsextend-* || return 1

  install -D -m644 tabs_extend.gedit-plugin ${pkgdir}/usr/lib/gedit-2/plugins/tabs_extend.gedit-plugin || return 1

  install -D -m644 tabs_extend.py ${pkgdir}/usr/lib/gedit-2/plugins/tabs_extend.py || return 1

}
