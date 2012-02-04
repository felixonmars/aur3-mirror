# Contributor:

pkgname=camsource
pkgver=0.7.0
pkgrel=7
pkgdesc="Grabs images from a v4l and v4l2 webcam devices"
arch=('i686' 'x86_64')
url="http://camsource.sourceforge.net/"
license=('GPL')
depends=('libxml2' 'libjpeg')
backup=('etc/camsource.conf')
options=('!libtool')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'mod_handle.c.patch')
md5sums=('ffd824f13f99011984399fc3b7526c71'
         'a8fabaf271b6f575c6e957573908c529')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np0 -i ${srcdir}/mod_handle.c.patch
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/etc/camsource.conf.example ${pkgdir}/etc/camsource.conf
}
