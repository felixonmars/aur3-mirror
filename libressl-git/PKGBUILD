# Maintainer mali#arh (temp)


pkgname=libressl-git
_gitname=portable
# use a pacman compatible version scheme
pkgver=208.a323f52
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/libressl-portable'
license=('custom:BSD')
makedepends=('git')
optdepends=('ca-certificates')
source=('git+https://github.com/libressl-portable/portable.git' 'libressl-dummy-rand-egd.patch')
pkgdesc='FREE version of the SSL/TLS protocol forked from OpenSSL - Portable edition'
# Uncomment this if you know what you are doing - libressl is not yet a replacement of openssl
provides=('openssl=1.0.2')
conflicts=('openssl')
md5sums=('SKIP'
         'd7a2062824e6437e5bcb026533a0baf2')

pkgver() {
cd $srcdir/$_gitname
printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {

	cd $srcdir/$_gitname
	./autogen.sh

# Dummy RAND_egd() function - Can help to compile some stuff - See https://blog.hboeck.de/archives/851-LibreSSL-on-Gentoo.html
patch -p1 < $srcdir/libressl-dummy-rand-egd.patch || exit 1

./configure --enable-libtls --prefix=/usr --with-gnu-ld --sysconfdir=/etc/ssh
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR=$pkgdir install

    # Ugly renaming of the libressl manual pages using the scheme of openssl because libressl doesn't provide the MANSUFFIX var yet - Look at the openssl PKGBUILD
    rename ".1" ".1ssl" "$pkgdir"/usr/share/man/man1/*
    rename ".3" ".3ssl" "$pkgdir"/usr/share/man/man3/*
    install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

# Dev Hack!! Note, this is just temporary fix to make pacman,curl,wget, etc. work, as they currently look for lib{ssl,crypto}.so.1.0.0!!! 
# This should be removed asap and will break when openssl libs versions are bumped. 
# Purely for a test system where breakage is expected.
#Uncomment below before building to get _some_ ABI compatibility.
cd "$pkgdir/usr/lib"
cp libssl.so.{30.0.1,1.0.0}
cp libcrypto.so.{30.0.4,1.0.0}
ln -sf libcrypto.so{.1.0.0,}
ln -sf libssl.so{.1.0.0,}
}

