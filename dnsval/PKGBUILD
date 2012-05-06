# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/
# Patches welcome: http://github.com/harvie/archlinux-packages

pkgname=dnsval
pkgver=1.12
pkgrel=2
pkgdesc="C libraries that implement DNSSEC aware DNS resolution APIs."
url="http://www.dnssec-tools.org/"
license="Custom"
arch=('i686' 'x86_64')
depends=('dnssec-anchors' 'dnssec-tools')
source=("http://www.dnssec-tools.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('61ea8957c8ec5117713b3fbd339d81db')
sha1sums=('e8d3d17279aab8689031854397fa343cdf4c8a65')
sha256sums=('19c9f337435d5ce8b80119ad21f543ddcfd58e8debcc7a0bc49c31b62607a0f6')
sha384sums=('4d3b232fe8c355379614c27dfb0298a4a0a98ffefc576bb0fbed2d3dfb6a27a3dd4efb1ac03ec433e84d7edc0017e238')
sha512sums=('64a236b19c731fc83465810dbab9ac7c6450faa4ccec4e8a914df115586fbd9b3779c3859edf572cfc7d47393a27bdd24ea9cd38220b9a0db33afb48ba9a7017')


build() {
	#Segfaults with optimizations...
		ARCH="$(echo -ne "$CARCH" | tr _ -)"
		export CFLAGS="-march=$ARCH -mtune=generic"
		export CXXFLAGS="-march=$ARCH -mtune=generic"
	echo $ARCH > /home/max/arch.txt

	cd ${srcdir}/${pkgname}-${pkgver}/ || return 1
	msg 'Configuring...'
	./configure\
		--exec_prefix=/usr --prefix=/usr\
		--sysconfdir=/etc --mandir=/usr/share/man\
		--with-resolv-conf=/etc/dnssec-tools/resolv.conf\
		--with-root-hints=/etc/dnssec-tools/root.hints\
		--with-dnsval-conf=/etc/dnsec-tools/dnsval.conf\
		--with-ipv6\
		--with-nsec3\
		--with-dlv 

	# msg 'Fixing bugs...'
		#grep VAL_ROOT_HINTS ./validator/libval/val_policy.h	|| {
		#	msg2 'fixing missing VAL_ROOT_HINTS in ./validator/libval/val_policy.h'
		#	root_hints="$(grep '^VAL_ROOT_HINTS=' ./validator/config.log | head -n 1 | tr = ' ' | tr "'" '"' | sed -e 's/\//\\\//g')"
		#	cat ./validator/libval/val_policy.h | sed -e 's/#include "val_parse.h"/#include "val_parse.h"\n#define '"$root_hints"'/' > tmp
		#	mv tmp ./validator/libval/val_policy.h
		#}

	msg 'Building...'
		make -j1
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || return 1	
	msg 'Installing files to package...'
		make -j1 install DESTDIR="${pkgdir}"
	msg 'Cleaning...'
		#have to do this because of some issues...
		rm -rf "${srcdir}/"
}
