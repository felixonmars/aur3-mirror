# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=lapsus
pkgver=0.0.6
pkgrel=4
pkgdesc="Controls additional features of Asus and IBM laptops in KDE3 environment (using appropriate kernel modules)."
arch=('i686' 'x86_64')
url="http://lapsus.berlios.de/"
license=('GPL')
depends=('kdelibs3')
makedepends=('chrpath')
install=lapsus.install
options=('!buildflags' '!libtool')
source=("http://download.berlios.de/lapsus/lapsus-${pkgver}.tar.bz2"
        lapsus.rc_script
        'gcc47.patch')
md5sums=('1013b513ba0ddb9cc82dbb9bb373c8ab'
         '78ea871f3a87d24166f3c1d344391b9c'
         '72a2a6b66fc86d1791a1a3da6fc43d3e')

build() {
  . /etc/profile.d/kde3.sh
  . /etc/profile.d/qt3.sh
  
  cd ${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/gcc47.patch

  ./configure --prefix=/opt/kde \
    --without-arts
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  # Remove RPATH
  chrpath -r /usr/lib/ "${pkgdir}"/opt/kde/lib/lapsus_panelapplet.so
  chrpath -r /usr/lib/ "${pkgdir}"/usr/sbin/lapsusd

  install -D -m0644 lapsus.conf $pkgdir/etc/dbus-1/system.d/lapsus.conf
  install -D -m0755 ${srcdir}/lapsus.rc_script ${pkgdir}/etc/rc.d/lapsusd
}
