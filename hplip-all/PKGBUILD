# $Id: PKGBUILD 116953 2011-03-26 16:48:46Z tpowa $
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Morgan LEFIEUX <comete@archlinuxfr.org>

pkgname=hplip-all
pkgname2=hplip
pkgver=3.11.5
pkgrel=1
pkgdesc="Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="http://hplipopensource.com"
license=('GPL')
makedepends=('python2-qt' 'pygobject' 'pkgconfig' 'sane' 'rpcbind' 'cups')
depends=('python2' 'ghostscript>=8.64-6' 'foomatic-db' 'foomatic-db-engine'
	'libcups>=1.3.10-3' 'net-snmp>=5.6.1' 'libusb-compat')
optdepends=('cups: for printing support'
            'dbus-python: for dbus support'
            'sane: for scanner support'
            'python-imaging: for commandline scanning support'
            'python-notify: for Desktop notification support'
            'rpcbind: for network support'
            'python2-qt: for running hp-toolbox'
            'pygobject: for running hp-toolbox')
replaces=('hpijs')
options=('!libtool')
install=hplip.install
source=(http://downloads.sourceforge.net/${pkgname2}/$pkgname2-$pkgver.tar.gz)

build() {
 cd "$srcdir/$pkgname2-$pkgver"
 #find . -type f -exec sed -i 's~^#.*env python~#!/usr/bin/env python2~' {} +
 export PYTHON=`which python2`
 ./configure --with-hpppddir=/usr/share/ppd/HP \
             --libdir=/usr/lib64 \
             --prefix=/usr \
             --enable-qt4 \
             --enable-doc-build \
             --enable-cups-ppd-install \
             --enable-foomatic-drv-install \
             --enable-foomatic-ppd-install \
             --enable-hpijs-install \
             --enable-policykit \
             --enable-cups-drv-install \
             --enable-hpcups-install \
             --enable-network-build \
             --enable-dbus-build \
             --enable-scan-build \
             --enable-fax-build

 make
}

package() {
 cd "$srcdir/$pkgname2-$pkgver"
 make DESTDIR="$pkgdir/" install

 #rm -rf "$pkgdir/etc/sane.d"
 # remove autostart of hp-daemon
 #rm -r "$pkgdir/etc/xdg"
 # move udev rules to /lib/udev/rules.d
 #mkdir -p "$pkgdir/lib/udev/rules.d"
 #mv "$pkgdir"/etc/udev/rules.d/* "$pkgdir/lib/udev/rules.d/"
 #rm -r "$pkgdir/etc/udev"
 # remove lp user, it's not used on archlinux
 #sed -i 's|OWNER="lp", ||g' "$pkgdir/lib/udev/rules.d/40-hplip.rules"
 # fix sysfs rules
 #sed -i -e "s|SYSFS|ATTRS|g" -e "s|sysfs|attrs|g" "$pkgdir/lib/udev/rules.d/56-hpmud_support.rules"
}
md5sums=('0a3d0f46ec89857b4c0feea6923864f1')
