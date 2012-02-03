# Maintainer: Kévin Guilloy <kevin@guilloy.ath.cx>

pkgname=qtcreator-todo-plugin-git
pkgver=20120203
pkgrel=1
pkgdesc="Collection of actions to improve productivity while writing code"
arch=('i686' 'x86_64')
url="http://gitorious.org/creator-plugins"
license=('BSD')
depends=('qt' 'qtcreator=2.4.1')
makedepends=('git' 'qtcreator-src=2.4.1')
source=('uptodate.patch')
sha256sums=('4f4f2cf0ae68f360fa385f9b209dcb62cd2073cfdd1af4f6d6c0a6a304d75d89')

_gitroot="git://gitorious.org/qt-creator-todo-plugin/qt-creator-todo-plugin.git"
_gitname="todo-plugin"

build() {
  cd "$startdir/src"
  git clone $_gitroot $_gitname --depth=1
  msg "Git checkout done or server timeout"

  patch -p0 < uptodate.patch

  cd "$_gitname"

  mkdir -p $startdir/pkg/usr/lib/qtcreator/plugins/vsorokin
  sed -i -e 's/\/home\/vass\/qt-creator/\/usr\/src\/qtcreator/' todoplugin.pro
  echo "LIBS += -L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins/Nokia" >> todoplugin.pro

  sed -i -e "s/\/opt\/qtcreator-2.1.81/\/usr/" todoplugin.pro
  sed -i -e "s/\$\$QTC_BUILD_DIR\/lib\/qtcreator\/plugins\/\$\$(PROVIDER)/..\/..\/pkg\/usr/" todoplugin.pro
  sed -i -e "s/\$\$QTC_BUILD_DIR/..\/..\/pkg\/usr/" todoplugin.pro

  sed -i -e "s/2\.1\.81/2\.4\.1/" todo.pluginspec

  qmake
  make
}
