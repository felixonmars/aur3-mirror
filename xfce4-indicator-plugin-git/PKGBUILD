# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

_pkgname=xfce4-indicator-plugin
pkgname=xfce4-indicator-plugin-git
pkgver=259.f722729
pkgrel=1
pkgdesc="Plugin to display information from applications in the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-indicator-plugin"
license=('GPL')
depends=('xfce4-panel' 'libindicator' 'hicolor-icon-theme' 'xdg-utils' 'libxfce4ui-git')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('indicator-application-gtk2: take menus from applications and place them in the panel'
            'indicator-sound-gtk2: unified sound menu')
install=$pkgname.install
source=(git://git.xfce.org/panel-plugins/xfce4-indicator-plugin.git)
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
