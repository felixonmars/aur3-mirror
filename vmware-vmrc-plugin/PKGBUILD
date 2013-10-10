#Maintainer: Adam Siliato <adam.siliato@gmail.com>
pkgname=vmware-vmrc-plugin
pkgver=5.1
pkgrel=1
pkgdesc="Vmware vmrc mozilla firefox plugin"
arch=('x86_64')
url="http://www.vmware.com/products/server/"
license=('custom')
makedepends=('firefox')
source=('VMware-VMRC.x86_64.bundle'
        'vmware-vmrc'
        'vmware-deviceMgr')

md5sums=('c61c91bbeca19fd818595ec34f60af0d'
         '88251ba2955df81a36de7716011280f0'
		 '88c54c6a03d2593b873033fe85a9dbb4')
prepare() {
	rm -rf $srcdir/tmp
	TMP=`readlink VMware-VMRC.x86_64.bundle`
	$TMP -x "$srcdir/tmp"
}


package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib/vmware-vmrc/ || return 1
  mkdir -p $pkgdir/usr/lib64/mozilla/plugins || return 1
  mkdir -p $pkgdir/etc/vmware-vmrc/5.1 || return 1

  cd $srcdir/tmp || return 1
  chmod -R 755 $srcdir/tmp/vmware-vmrc-5.1/bin
  cp -R $srcdir/tmp/vmware-vmrc-5.1 $pkgdir/usr/lib/vmware-vmrc/5.1 || return 1

  cd $pkgdir/usr/lib/vmware-vmrc/5.1 || return 1

  ln -s /usr/lib/vmware-vmrc/5.1/np-vmware-vmrc-5.1.0-781747-64.so $pkgdir/usr/lib64/mozilla/plugins/np-vmware-vmrc-5.1.0-781747.so

  ln -s /usr/lib/vmware-vmrc/5.1/bin/appLoader $pkgdir/usr/lib/vmware-vmrc/5.1/bin/vmware-vmrc
  ln -s /usr/lib/vmware-vmrc/5.1/bin/appLoader $pkgdir/usr/lib/vmware-vmrc/5.1/bin/vmware-vmrc-daemon
  ln -s /usr/lib/vmware-vmrc/5.1/bin/appLoader $pkgdir/usr/lib/vmware-vmrc/5.1/bin/vmware-deviceMgr

  ln -s /usr/lib/vmware-vmrc/5.1/bin/vmware-vmrc-daemon $pkgdir/usr/lib/vmware-vmrc/5.1/vmware-vmrc-daemon
  cp $srcdir/vmware-vmrc $pkgdir/usr/lib/vmware-vmrc/5.1/vmware-vmrc
  chmod +x $pkgdir/usr/lib/vmware-vmrc/5.1/vmware-vmrc
  cp $srcdir/vmware-deviceMgr $pkgdir/usr/lib/vmware-vmrc/5.1/vmware-deviceMgr
  chmod +x $pkgdir/usr/lib/vmware-vmrc/5.1/vmware-deviceMgr

  # Housekeeping (required for operation)
  echo "libdir = \"/usr/lib/vmware-vmrc/5.1\"" > $pkgdir/etc/vmware-vmrc/5.1/config
  sed -e "s,@@LIBCONF_DIR@@,/usr/lib/vmware-vmrc/5.1/libconf,g" --in-place $pkgdir/usr/lib/vmware-vmrc/5.1/libconf/etc/gtk-2.0/gdk-pixbuf.loaders
  sed -e "s,@@LIBCONF_DIR@@,/usr/lib/vmware-vmrc/5.1/libconf,g" --in-place $pkgdir/usr/lib/vmware-vmrc/5.1/libconf/etc/gtk-2.0/gtk.immodules
}
