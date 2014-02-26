# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>

## based on 'collectd' package -- original maintainers as follows:
# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>

_pkgbase=collectd
_pluginname=nut
pkgname=${_pkgbase}-plugin-${_pluginname}
# XXX: we use the same version of 'collectd' found in the official community repo
#      as our plugin is built to "drop-into" an existing collectd installation
pkgver=5.4.1
pkgrel=1
pkgdesc='collectd plugin for network-ups-tools (nut)'
_urlbase='http://collectd.org'
url="${_urlbase}/wiki/index.php/Plugin:NUT"
arch=('i686' 'x86_64')
license=('GPL')

# XXX: only depend on 'network-ups-tools' because all we're interested in is
#      nut.so
depends=('libltdl'
         'iptables'
         'network-ups-tools-full'
         "collectd=${pkgver}")

source=("${_urlbase}/files/${_pkgbase}-${pkgver}.tar.bz2"
        'libperl.patch'
        'service')
sha1sums=('cea47e3936ed081bd71efacf7ba825fc837dc347'
          'efa6450c20ce314e9000a69b17520211f6a471e1'
          '04f676d0b76c34df0bbf94629813e035b1febe04')

options=('!libtool')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	sed 's/-Werror//g' -i *.ac */*.{am,in} */*/*.{am,in}
	patch -p1 -i ../libperl.patch
	autoreconf
}

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-static \
		--disable-all-plugins \
		--enable-nut
	make all
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/etc"
	rm -rf "${pkgdir}/var"
	rm -rf "${pkgdir}/usr/bin"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/perl5"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm "${pkgdir}/usr/lib/libcollectdclient.so"
	rm "${pkgdir}/usr/lib/libcollectdclient.so.1"
	rm "${pkgdir}/usr/lib/libcollectdclient.so.1.0.0"
	rm -rf "${pkgdir}/usr/share"
	#rmdir "${pkgdir}/var/run" # FS#30201
	#install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/collectd.service
	#install -Dm644 contrib/collectd2html.pl "${pkgdir}"/usr/share/collectd/collectd2html.pl
}
