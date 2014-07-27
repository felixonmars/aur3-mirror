
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=dnssec-tools
pkgver=2.0
pkgrel=7
pkgdesc="libval & dnssec management tools"
arch=('i686' 'x86_64')
url="http://www.dnssec-tools.org"
license=('BSD')
conflicts=('libval' 'libval_shim' 'libsres')
backup=('etc/dnssec-tools/dnssec-tools.conf' 'etc/dnssec-tools/resolv.conf' 'etc/dnssec-tools/root.hints' 'etc/dnssec-tools/dnsval.conf')
depends=('dnsutils' 'perl' 'perl-timedate' 'perl-net-dns' 'perl-net-dns-sec' 'perl-mailtools' 'perl-tk' 'perl-graphviz' 'bind' 'openssl' 'glibc' 'pth')
source=(http://www.dnssec-tools.org/download/${pkgname}-${pkgver}.tar.gz patch.p0)
md5sums=('b738664499c150cf81a1c4307ff07e0f'
         '5cdd26a41ab092c0280dce02ecbd44c3')
sha1sums=('4cae015ba8fe6aba66131cd9f0ae0c8dd4524f01'
          '0935b949c8f87ff8da92d4fa8f5c2af5e745b47f')
sha256sums=('7fd5d483c7a4b25277f17d9010b8de79a21948884368e6d870bec0194d007445'
            'fb23565ff9afabf85dc812ab500a3652add4537e9519a49214e329de3d2171f9')
install="dnssec-tools.install"

prepare() {
	# patch for race condition with -j 2+
	DIR=$(pwd)
	cd "$srcdir/${pkgname}-${pkgver}"
	patch -p 0 < ${DIR}/patch.p0
}

build() {

	export LDFLAGS=$(echo -n $LDFLAGS |tr ',' '\n'|grep -v -- '--as-needed'|tr '\n' ',' |rev|cut -c 2-|rev)
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure	--exec_prefix=/usr \
			--prefix=/usr \
			--mandir=/usr/share/man \
			--sysconfdir=/etc \
			--with-ipv6 \
			--with-nsec3 \
			--with-dlv
	make DESTDIR="${pkgdir}"
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	cp validator/etc/dnsval.conf validator/etc/root.hints ${pkgdir}/etc/dnssec-tools/
	cd "${pkgdir}/etc/dnssec-tools"
	mkdir KEY-SAFE
	## add support for ISC DLV checking
	cat >> dnsval.conf <<EOF
##################################
# ISC DLV root anchor 
##################################
: dlv-trust-points
    .   dlv.isc.org.
;
EOF

	sed -i 's/\/usr\/local\/sbin/\/usr\/bin/' dnssec-tools.conf
	sed -i 's/\/usr\/local\/etc/\/etc/' dnssec-tools.conf
}


