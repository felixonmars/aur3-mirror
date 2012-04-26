# Maintainer: Andrew Boktor
# Copied from package torque by flub

pkgname=torque3
pkgver=3.0.3
pkgrel=4
pkgdesc='An open source resource manager providing control over batch jobs and distributed compute nodes.'
url='http://www.clusterresources.com/products/torque-resource-manager.php'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssh')
makedepends=('make' 'gcc')
optdepends=()
install=torque.install
options=(!libtool)
backup=(var/spool/torque/server_name var/spool/torque/mom_priv/config var/spool/torque/serv_priv/{nodes,serverdb})
source=("http://www.clusterresources.com/downloads/torque/torque-${pkgver}.tar.gz"
        "torque-server"
        "torque-node"
	"torque-scheduler")
md5sums=( 'f6e7271673a4290414b04081c07e3437'
          '41581ea0fba02960ec7c128432f8f6ec'
          'dfe8aa183dd9ec5dfcc2ba6a5f234053'
          'e17b16f4898f1bfbbc4a6c208973889e')

build() {
  cd "${srcdir}/torque-${pkgver}"
  ./configure --with-default-server=localhost \
              --with-server-home=/var/spool/torque \
  				    --with-rcp=scp \
  				    --prefix=/usr \
  				    --disable-gcc-warnings \
  				    --mandir=/usr/share/man \
  				    --enable-high-availability || return 1
  mv src/resmom/Makefile src/resmom/Makefile.old
  cat src/resmom/Makefile.old | sed 's/$(MOMLIBS) $(PBS_LIBS)/$(PBS_LIBS) $(MOMLIBS)/g' > src/resmom/Makefile
  make || return 1
}

package() {
  cd "${srcdir}/torque-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
  mkdir -p ${pkgdir}/etc/rc.d/
  cp ${srcdir}/torque-server ${pkgdir}/etc/rc.d/
  cp ${srcdir}/torque-node ${pkgdir}/etc/rc.d/ 
  cp ${srcdir}/torque-scheduler ${pkgdir}/etc/rc.d/
}

# vim:set ts=2 sw=2 et:

