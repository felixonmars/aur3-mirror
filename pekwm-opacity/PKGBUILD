# Maintainer: n1ck <itan1ckita@gmail.com>
pkgname=pekwm-opacity
pkgver=0.1.12
pkgrel=1
pkgdesc="A small, fast, functional, and flexible window manager with opacity patch"
arch=(i686 x86_64)
license=('GPL')
url="http://pekwm.org/"
depends=('gcc-libs' 'libjpeg>=7' 'libpng' 'libxft' 'libxinerama' 'libxpm'
'libxrandr')
provides=('pekwm')
conflicts=('pekwm')
replaces=('pekwm')
source=(http://www.pekwm.org/projects/pekwm/files/pekwm-${pkgver}.tar.gz
pekwm.desktop http://pastebin.com/download.php?i=ZR7dGUUg)

build() {
  cd ${srcdir}/pekwm-${pkgver}
  patch -p1 < ../download.php?i=ZR7dGUUg || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --enable-opacity

  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/pekwm.desktop \
                   ${pkgdir}/etc/X11/sessions/pekwm.desktop
}

md5sums=('1f7f9ed32cc03f565a3ad30fd6045c1f'
         '5a78fc6653fbb0b7282ecf7f1f81e2c5'
         '689dafed9719c324f3cad0076ef39366')
