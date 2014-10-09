# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributer: Marat "Morion" Talipov <morion.self@gmail.com>
_gitname=ProjectTox-Qt-GUI
pkgname=tox-qt-git
pkgver=0.1.0.r382.g102a776
pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
epoch=1
pkgrel=1
pkgdesc="FOSS instant messaging application aimed to replace Skype (GUI) (Git version)"
arch=('i686' 'x86_64')
url="http://tox.im"
license=('GPL3')
depends=('tox-git' 'qt5-base')
makedepends=('git')
conflicts=('tox-qt' 'tox-qt-gui')
provides=('tox-qt')
replaces=('tox-qt-gui')
source=("git+https://github.com/nurupo/$_gitname.git")
md5sums=('SKIP')

prepare() {
  cd "$_gitname"
  git submodule update --init --recursive
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$_gitname/build"
  qmake -qt=5 ../projectfiles/QtCreator/TOX-Qt-GUI.pro
  make
}

package() {
  cd "$_gitname/build"
  install -Dm755 TOX-Qt-GUI "$pkgdir/usr/bin/tox-qt"
}
# vim:set ts=2 sw=2 et:
