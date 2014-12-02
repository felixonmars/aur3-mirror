# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=seznamfs
pkgver=0.2.3
pkgrel=1
pkgdesc="Distributed binlogging filesystem based on FUSE"
arch=('i686' 'x86_64')
url="http://seznamfs.sourceforge.net/"
license=('GPL3')
depends=('fuse' 'libcfgparser' 'libdbglog')
makedepends=('automake' 'autoconf' 'patch')
backup=('etc/$pkgname/$pkgname.conf')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2
        $pkgname-gcc44.patch)
md5sums=('77f433183df51f1336757da13b450df1'
         '622d252168f1ee7220e9c65146495898')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  aclocal
  automake --foreign --add-missing --copy
  autoconf

  patch -Np0 -i "${srcdir}"/$pkgname-gcc44.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/var/log/$pkgname
  install -D -m644 etc/logrotate "${pkgdir}"/etc/logrotate.d/$pkgname
  install -D -m644 conf/$pkgname.conf "${pkgdir}"/etc/$pkgname.conf
  install -D -m644 help/$pkgname.html "${pkgdir}"/usr/share/doc/$pkgname/$pkgname.html
  install -D -m644 help/initscript.example "${pkgdir}"/usr/share/doc/$pkgname/examples/initscript.example
  install -D -m644 help/logrotate.example "${pkgdir}"/usr/share/doc/$pkgname/examples/logrotate.example
}
