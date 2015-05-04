# Maintainer : Kit <kit rule at gmail dot com>
# Contributor: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]

pkgname=xfce4-hardware-monitor-plugin-git
_prj=xfce4-hardware-monitor-plugin
pkgver=1.4.6
pkgrel=1
pkgdesc="Plugin for the Xfce4 panel that lets you monitor CPU usage, network bandwith, etc."
arch=('i686' 'x86_64')
provides=('xfce4-hardware-monitor-plugin')
replaces=('xfce4-hardware-monitor-applet-git')
url=('http://goodies.xfce.org/projects/panel-plugins/xfce4-hardware-monitor-plugin')
depends=('lm_sensors' 'libglademm' 'libgnomecanvasmm' 'libgtop' 'xfce4-panel')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
license=('GPL3')
source=("git://git.xfce.org/panel-plugins/xfce4-hardware-monitor-plugin#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_prj}"
  _release=$(grep Release ChangeLog | head -n 1 | awk '{print $2}')
  printf "${_release}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_prj}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_prj}"
  make DESTDIR=${pkgdir} install
}