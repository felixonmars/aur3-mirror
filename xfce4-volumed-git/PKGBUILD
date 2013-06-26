# Mantainer: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=xfce4-volumed-git
pkgver=27.0ebbdc3
pkgrel=2
pkgdesc="A volume keys control daemon for Xfce"
arch=('any')
license=('GPL2')
url="http://git.xfce.org/apps/xfce4-volumed/"
depends=('gstreamer0.10-base' 'libkeybinder2' 'libnotify' 'xfconf')
optdepends=('gstreamer0.10-base-plugins: for sound card support'
            'xfce4-notifyd: for OSD notifications')
makedepends=('git' 'xfce4-dev-tools')
provides=('xfce4-volumed')
conflicts=('xfce4-volumed' 'xfce4-volumed-pulse')
source=('git://git.xfce.org/apps/xfce4-volumed')
md5sums=('SKIP')


pkgver() {
  cd $provides
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd $provides
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var
  make
}


package() {
  cd "${srcdir}/${provides}"
  make DESTDIR="${pkgdir}" install
}
