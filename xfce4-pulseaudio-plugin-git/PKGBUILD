# Maintainer: Silvio Knizek <killermoehre@gmx.net>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-pulseaudio-plugin
pkgname="${_pkgname}-git"
pkgver=0.2.2.r8.g405f94a
pkgrel=1
pkgdesc="Pulseaudio plugin for Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-pulseaudio-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel>=4.11.0' 'libpulse' 'libkeybinder3' 'libnotify')
makedepends=('git' 'intltools' 'xfce4-dev-tools')
optdepends=('ido: appindicator support'
            'pavucontrol: default pulseaudio mixer')
makedepends=('intltool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/panel-plugins/${_pkgname}")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-keybinder \
    --enable-libnotify \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
