# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgname=glib2-ubuntu
_ubuntu_rel=0ubuntu1
pkgver=2.40.0
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('pcre' 'libffi')
makedepends=('pkg-config' 'python2' 'libxslt' 'docbook-xml' 'elfutils')
optdepends=('python2: for gdbus-codegen and gtester-report'
            'elfutils: gresource inspection tool')
provides=("glib2=${pkgver}")
replaces=('glib2')
conflicts=('glib2')
options=('!docs' '!libtool' '!emptydirs')
source=("http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz"
        'revert-warn-glib-compile-schemas.patch')
sha512sums=('346a32f2d1447d3398ac2400047f0556517b914788cf9c8c9f28de5f395ef3993231f9a58fc103e08013fa2e7136a097de46aabdf4c035a46f883ca3971408a4'
            '8d5da70a3ef39771e8dc61e050b7425922012f2d4094bff64bc3efdef12974bd4fea853c52f099b47b6464bc65daf8de5796a2d93ffe2c1100e75d72ce5c9053')

prepare() {
  cd "${srcdir}/glib-${pkgver}"

  patch -p1 -R -i "${srcdir}/revert-warn-glib-compile-schemas.patch" 
}

build() {
  cd "${srcdir}/glib-${pkgver}"

  autoreconf -vfi

  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --with-pcre=system \
    --disable-fam

  make
}

check() {
  cd "${srcdir}/glib-${pkgver}"
  #make check || :
}

package() {
  cd "${srcdir}/glib-${pkgver}"
  make completiondir=/usr/share/bash-completion/completions/ \
       DESTDIR="${pkgdir}" install

  for i in "${pkgdir}/usr/share/bash-completion/completions/"*; do
chmod -x "${i}"
  done

  # Our gdb does not ship the required python modules, so remove it
  rm -rf "${pkgdir}/usr/share/gdb/"
}
