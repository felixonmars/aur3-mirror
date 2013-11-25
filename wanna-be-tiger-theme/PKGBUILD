# Contributor: xavi <xavi@netsons.org>
pkgname=wanna-be-tiger-theme
pkgver=0.1
pkgrel=3
pkgdesc="A gray, MacOSX Tiger inspired, light fluxbox theme"
arch=('i686' 'x86_64')
url="http://www.neogrigio.t15.org/"
license=('GPL')
groups=()
depends=('fluxbox')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(theme.cfg)
noextract=()

md5sums=('2b1395a0752e1a663b8a16926dfd7dbd')

build() {
  install -D -m775 $srcdir/theme.cfg $pkgdir/usr/share/fluxbox/styles/$pkgname/theme.cfg
}
