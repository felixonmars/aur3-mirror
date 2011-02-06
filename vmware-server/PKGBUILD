pkgname=vmware-server
pkgver=2.0.2
pkgrel=2
pkgdesc="Powerful server virtualization software"
arch=('i686' 'x86_64')
url="http://www.vmware.com/products/server/"
license=('custom')
depends=('kernel26>=2.6.29' 'libxt' 'libxtst' 'libxi' 'libxrender' 'zlib' 'perl' 'xinetd' 'vmware-server-modules' 'expat' 'libpng12' 'libxml2')
conflicts=('vmware-workstation' 'vmware-player')
options=('!strip' '!libtool')
install=vmware-server.install
source=(vmware vmserver.patch)
md5sums=('6fd7f9f326340ea552eeceba0ba9561c'
         '1204e0ab0e77beaf06e896749cbe33ad')

case ${CARCH} in
  i686)
  source=(${source[@]} 'VMware-server-2.0.2-203138.i386.tar.gz')
    md5sums=(${md5sums[@]} '6eb844d1ab4aed6128438e5f587d10bb');;
  x86_64)
  source=(${source[@]} 'VMware-server-2.0.2-203138.x86_64.tar.gz')
    md5sums=(${md5sums[@]} 'cc7aef813008eeb7150c21547d431b39');;
esac

build() {
 
  # This package doesn't deal with the modules, just delete them.
  cd "$srcdir/vmware-server-distrib/lib/modules/source"

  for module in vmmon vmnet; do
     rm $module.tar || return 1
  done
  
  cd "$srcdir/vmware-server-distrib"

  # Patch for Arch packaging
  patch -Np1 -i "$srcdir/vmserver.patch" || return 1

  # Install binary files
  mkdir -p "$pkgdir/usr/bin" || return 1
  install -m755 bin/* "$pkgdir/usr/bin" || return 1
  chmod u+s "$pkgdir/usr/bin/vmware-ping" || return 1

  mkdir -p "$pkgdir/usr/sbin" || return 1
  install -m755 sbin/* "$pkgdir/usr/sbin" || return 1
  chmod u+s "$pkgdir/usr/sbin/vmware-authd" || return 1

  # Install libs
  mkdir -p "$pkgdir/usr/lib/vmware" || return 1
  cp -a lib/* "$pkgdir/usr/lib/vmware" || return 1
  rm -rf "$pkgdir/usr/lib/vmware/modules/binary" || return 1
  chmod -R u+w "$pkgdir/usr/lib/vmware" || return 1
  chmod u+s "$pkgdir/usr/lib/vmware/bin/vmware-vmx" || return 1

  # Install configuration files
  install -D -m755 etc/installer.sh "$pkgdir/etc/vmware/installer.sh" || return 1
#  install -D -m644 etc/signing-key.pub "$pkgdir/etc/vmware/signing-key.pub" || return 1
  install -D -m644 etc/pam.d/vmware-authd "$pkgdir/etc/vmware/pam.d/vmware-authd" || return 1
  mkdir -p "$pkgdir/etc/vmware/hostd" || return 1
  cp -a etc/hostd/* "$pkgdir/etc/vmware/hostd" || return 1
  chmod -R u+w "$pkgdir/etc/vmware/hostd" || return 1
  install -D -m644 etc/service/services.xml "$pkgdir/etc/vmware/service/services.xml" || return 1

  # Create fake init directories
  for i in `seq 0 6`; do
    mkdir -p "$pkgdir/etc/vmware/init.d/rc$i.d" || return 1
  done
  install -D -m755 installer/services.sh "$pkgdir/etc/vmware/init.d/vmware" || return 1

  # Install init script
  install -D -m755 "$srcdir/vmware" "$pkgdir/etc/rc.d/vmware" || return 1

  # Install man page
  install -D -m644 man/man1/vmware.1.gz "$pkgdir/usr/share/man/man1/vmware.1.gz" || return 1

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses/vmware-server" || return 1
  install -m644 doc/{EULA,open_source_licenses.txt} \
    "$pkgdir/usr/share/licenses/vmware-server" || return 1

  VMWARE_LIB_DIR=${pkgdir}/usr/lib/vmware/lib
  # Gentoo Bug 282213
  mv "${VMWARE_LIB_DIR}"/libpng12.so.0/libpng12.so.0 \
          "${VMWARE_LIB_DIR}"/libpng12.so.0/libpng12.so.0.old
  ln -s /usr/lib/libpng12.so.0 "${VMWARE_LIB_DIR}"/libpng12.so.0/libpng12.so.0

  # Gentoo Bug 292771
  mv "${VMWARE_LIB_DIR}"/libexpat.so.0/libexpat.so.0 \
          "${VMWARE_LIB_DIR}"/libexpat.so.0/libexpat.so.0.old
  ln -s /usr/lib/libexpat.so.1 "${VMWARE_LIB_DIR}"/libexpat.so.0/libexpat.so.0
  mv "${VMWARE_LIB_DIR}"/libxml2.so.2/libxml2.so.2 \
          "${VMWARE_LIB_DIR}"/libxml2.so.2/libxml2.so.2.old
  ln -s /usr/lib/libxml2.so.2 "${VMWARE_LIB_DIR}"/libxml2.so.2/libxml2.so.2 
}
