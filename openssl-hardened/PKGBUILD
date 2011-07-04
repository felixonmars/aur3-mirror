# 

pkgname=openssl-hardened
_ver=1.0.0d
# use a pacman compatible version scheme
_aur_sucks_pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_aur_sucks_pkgver
pkgver=1.0.0.d
pkgrel=3
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        'fix-manpages.patch'
        'no-rpath.patch'
        'ca-dir.patch')
md5sums=('40b6ea380cc8a5bf9734c2f8bf7e701e'
         '5bbc0655bda2af95bc8eb568963ce8ba'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90')
replaces=('openssl<=1.0.0.d-1')
provides=('openssl=1.0.0.d-1')
conflicts=('openssl=>1.0.0.d-1')

# keep an upgrade path for older installations
PKGEXT='.pkg.tar.gz'

build() {
	pkgname="openssl"
	cd $srcdir/$pkgname-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
	fi

	# avoid conflicts with other man pages
	# see http://www.linuxfromscratch.org/patches/downloads/openssl/
	patch -p1 -i $srcdir/fix-manpages.patch
	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib enable-md2 \
		"${openssltarget}" \
		-Wa,--noexecstack "${CFLAGS} -D_FORTIFY_SOURCE=2 -fstack-protector --param ssp-buffer-size=4" "${LDFLAGS} -Wl,-z,relro -Wl,-z,now"

 	make depend
	make
}

check() {
	pkgname="openssl"
	cd $srcdir/$pkgname-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch

	# [test_ecdsa] Error 1 
	# ^ This seems to fail on some machines, search on Google for up2date information about this bug. Seems to be an error in the testsuite, just run the build again and see if it goes away.
	make test

	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	pkgname="openssl"
	cd $srcdir/$pkgname-$_ver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	pkgname="openssl-hardened"
}

