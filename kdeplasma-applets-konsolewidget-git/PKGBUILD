# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-konsolewidget-git
pkgver=20121003
pkgrel=1
pkgdesc="Semi-transparent Plasma Dashboard Konsole widget that retains its size and position"
arch=('any')
url='http://kde-apps.org/content/show.php?content=142753'
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python2')
makedepends=('git' 'cmake' 'automoc4')
conflicts=('kdeplasma-applets-konsolewidget')
provides=('kdeplasma-applets-konsolewidget')

_gitroot="git://github.com/JustinBuser/Konsole-Widget.git"
_gitname="Konsole-Widget"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -d "${pkgdir}"/usr/share/apps/plasma/plasmoids/KonsoleWidget/contents/code

  cd ${_gitname}
  install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-konsolewidget.desktop
  install -m644 metadata.desktop \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/KonsoleWidget/

  cd contents/code
  install -m755 {configuration,main,skeleton}.py \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/KonsoleWidget/contents/code
}
