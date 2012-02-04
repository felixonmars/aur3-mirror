# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=openssl-bionic
pkgver=0.9.8o
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security, built with Bionic libc'
arch=('i686')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl' 'bionic-svn')
optdepends=('ca-certificates')
source=("https://www.openssl.org/source/openssl-$pkgver.tar.gz" 'Configure.patch')
md5sums=('63ddc5116488985e820075e65fbe6aa4' '130ca34a9621b271f2e4cf3543490329')

_bionicwrapper=("gcc  -I /usr/lib/bionic/libc/include -I /usr/lib/bionic/libc/kernel/common/linux/ \
-I /usr/lib/bionic/libc/kernel/common/ -I /usr/lib/bionic/libc/arch-x86/include/ \
-I /usr/lib/bionic/libc/kernel/arch-x86/  -I /usr/lib/bionic/libc/private -fPIC -DPIC -nostdinc -nostdlib -static -l /usr/lib/bionic/bionic.a\
-Dwchar_t='char' -fno-builtin -D_SIZE_T_DECLARED -DElf_Size='u_int32_t' -I /usr/lib/bionic/libm/include \
-L /usr/lib/bionic  -D_BYTE_ORDER=_LITTLE_ENDIAN -lc")

build() {
# build instructions taken from: https://bitbucket.org/jrossi/metasploit/src/7f4bdc5394ca/documentation/posix_meterpreter.txt

	rm -rf $srcdir/build
	cp -ar $srcdir/openssl-$pkgver $srcdir/build #starting fresh every time
	cd $srcdir/build

	patch -p0 Configure $srcdir/Configure.patch
	./Configure threads no-zlib no-krb5 386 --prefix=/usr linux-msf no-dlfcn shared

	make CC="$_bionicwrapper" depend clean all
}

package() {
	cd $srcdir/openssl-$pkgver
  install -D -m755 libcrypto.so.0.9.8 "$pkgdir/usr/lib/libcrypto.so.0.9.8"
  install -D -m755 libssl.so.0.9.8 "$pkgdir/usr/lib/libssl.so.0.9.8"	
}