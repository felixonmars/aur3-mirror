# Maintainer: Christos Nouskas <nous[at]archlinux.us>
# Original Maintainer: lorenzog <lorenzo[at]keepsimple[dot]it>

pkgname=memopal
pkgver=2.3.0
_pkgver=${pkgver}-0
pkgrel=1
pkgdesc="An online backup, storage and file sharing tool, all-in-one."
url="http://www.memopal.com/"
arch=('x86_64' 'i686')
license=('custom:"Copyright 2007-2011 Memopal Srl"')
depends=('curl')
optdepends=('davfs2: mounting support')
makedepends=('rpmextract')
source=('license')

if [ "${CARCH}" = "x86_64" ]; then
	_carch=x86_64
	source=("http://apps.memopal.com/download/memopal/memopal-${_pkgver}.${_carch}.rpm"
#		"http://arm.konnichi.com/2010/03/28/core/os/${CARCH}/openssl-0.9.8n-1-${CARCH}.pkg.tar.xz"
		${source[@]})
	sha256sums=('63884b4a066203c041ad806d8c38d7c65ec3771bf4b29c8147558c32ef83fe23'
		    '915eeb441fba535076004c4487a17d185ff71b6bcfd349ac0571f4c8de014832')

elif [ "${CARCH}" = "i686" ]; then
	_carch=i386
	source=("http://apps.memopal.com/download/memopal/memopal-${_pkgver}.${_carch}.rpm"
#		"http://arm.konnichi.com/2010/03/28/core/os/${CARCH}/openssl-0.9.8n-1-${CARCH}.pkg.tar.xz"
		${source[@]})
	sha256sums=('88427568ab126a017e8f459a58f633ffa9d43cd98ad84dcd5f1f79ae14495544'
		    '915eeb441fba535076004c4487a17d185ff71b6bcfd349ac0571f4c8de014832')
fi

build() {
	rpmextract.sh memopal-${_pkgver}.${_carch}.rpm
}

package() {
	# install configuration file, rc script and binary
	# TODO: systemd service file
	mkdir -p ${pkgdir}/etc/rc.d
	install -D -m755 ${srcdir}/etc/init.d/memopal ${pkgdir}/etc/rc.d/
	install -D -m644 ${srcdir}/etc/memopal.conf.sample ${pkgdir}/etc/
	tr -d '\r' < ${pkgdir}/etc/memopal.conf.sample > ${pkgdir}/etc/memopal.conf
	sed -i "s|=/etc/pki/tls/cert.pem|=/etc/ssl/certs/ca-certificates.crt|" ${pkgdir}/etc/memopal.conf
	mkdir -p ${pkgdir}/usr/bin
	install -D -m755 ${srcdir}/usr/bin/memopal ${pkgdir}/usr/bin/

	# Symlink to Arch crypto/ssl libs
	mkdir -p ${pkgdir}/usr/lib/
	ln -s /usr/lib/libcrypto.so.1.0.0 ${pkgdir}/usr/lib/libcrypto.so.10
	ln -s /usr/lib/libssl.so.1.0.0 ${pkgdir}/usr/lib/libssl.so.10

	mkdir -p ${pkgdir}/usr/share/licenses/memopal
	install -D -m644 ${srcdir}/license ${pkgdir}/usr/share/licenses/memopal
}
