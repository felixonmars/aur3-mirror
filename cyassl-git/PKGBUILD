# Maintainer: Tom Debruyne <tomdebruyne at gmail dot com>
pkgname=cyassl-git
pkgver=20120413
pkgrel=1
pkgdesc="A small, fast, portable implementation of TLS/SSL for embedded devices to the cloud"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url=('http://www.yassl.com/')
optdepends=()
makedepends=('git' 'make' 'gcc' 'libtool' 'autoconf' 'gawk')
provides=('cyassl')
conflicts=('cyassl')

_gitroot="git://github.com/cyassl/cyassl.git"
_gitname="cyassl"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
	else
	git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

        rm -rf $srcdir/$_gitname-build
        git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
        cd $srcdir/$_gitname-build
	
	./autogen.sh
        if test "$CARCH" == x86_64; then
        ./configure --prefix=/usr --sysconfdir=/etc --enable-fastmath \
                    --enable-fasthugemath --enable-bump \
                    --enable-opensslExtra --enable-fortress \
                    --enable-keygen --enable-certgen \
                    --disable-debug --disable-ecc \
                    --disable-small --disable-ntru \
                    --disable-noFilesystem --disable-noInline \
                    --disable-gcc-lots-o-warnings   || return 1
        fi
        if test "$CARCH" == i686; then
        ./configure --prefix=/usr --sysconfdir=/etc --disable-fastmath \
                    --disable-fasthugemath --disable-bump \
                    --enable-opensslExtra --enable-fortress \
                    --enable-keygen --enable-certgen \
                    --disable-debug --disable-ecc \
                    --disable-small --disable-ntru \
                    --disable-noFilesystem --disable-noInline \
                    --disable-gcc-lots-o-warnings   || return 1
        fi
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	
}



