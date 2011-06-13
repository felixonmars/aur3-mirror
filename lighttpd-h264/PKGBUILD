# Maintainer: Nick Campbell <s0ma AT theangryfist DOT net>
# Contributer: Pierre Schmitz <pierre@archlinux.de>

pkgname=lighttpd-h264
pkgver=1.4.28
pkgrel=1
_h264ver=2.2.9
pkgdesc='a secure, fast, compliant and very flexible web-server with CodeShop H264 streaming module.'
license=('custom')
arch=('i686' 'x86_64')
url="http://www.lighttpd.net/"
depends=('pcre' 'bzip2' 'libldap' 'util-linux-ng')
makedepends=('fcgi' 'libmysqlclient' 'lua' 'libxml2' 'e2fsprogs' 'sqlite3' 'gdbm' 'pkgconfig')
optdepends=('libxml2: mod_webdav'
            'lua: mod_cml/mod_magnet'
            'libmysqlclient: mod_mysql_vhost'
            'sqlite3: mod_webdav')
backup=('etc/lighttpd/lighttpd.conf' 'etc/logrotate.d/lighttpd')
options=('!libtool' 'emptydirs')
source=("http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${pkgver}.tar.bz2"
        "http://h264.code-shop.com/download/lighttpd-1.4.18_mod_h264_streaming-${_h264ver}.tar.gz"
	"lighttpd-1.4.28-Makefile.am-h264-streaming.patch"
        'lighttpd.rc.d' 'lighttpd.logrotate.d' 'lighttpd.conf')

md5sums=('586eb535d31ac299652495b058dd87c4'
         '9cecce34321d3d0e54dd11dc129f4349'
         'a5bf8df58f3e72504f7688f5822c4c4f'
         '517a048cb54a37463c8e4a1dde637cf6'
         '857e174643fd7761a2f0d8431a679f6c'
         '0b4a308f0e8d4d317618c430d6f4289b')

build() {

        cp ${srcdir}/lighttpd-1.4.18/src/mod_h264_streaming.c ${srcdir}/lighttpd-${pkgver}/src/
        cp ${srcdir}/lighttpd-1.4.18/src/mod_streaming_export.h ${srcdir}/lighttpd-${pkgver}/src/
        cp ${srcdir}/lighttpd-1.4.18/src/output_mp4.* ${srcdir}/lighttpd-${pkgver}/src/
	cp ${srcdir}/lighttpd-1.4.18/src/output_bucket.* ${srcdir}/lighttpd-${pkgver}/src/
	cp ${srcdir}/lighttpd-1.4.18/src/mp4_* ${srcdir}/lighttpd-${pkgver}/src/
        cp ${srcdir}/lighttpd-1.4.18/src/moov.* ${srcdir}/lighttpd-${pkgver}/src/

        patch -u ${srcdir}/lighttpd-${pkgver}/src/Makefile.am ${srcdir}/lighttpd-1.4.28-Makefile.am-h264-streaming.patch
  
        cd ${srcdir}/lighttpd-${pkgver}

	./autogen.sh

        ./configure --prefix=/usr \
		--enable-maintainer-mode \
                --libexecdir=/usr/lib/lighttpd/modules \
                --sysconfdir=/etc/lighttpd \
                --with-mysql \
                --with-ldap \
                --with-attr \
                --with-openssl \
                --with-kerberos5 \
                --without-fam \
                --with-webdav-props \
                --with-webdav-locks \
                --with-gdbm \
                --with-memcache \
                --with-lua
        make
}

package() {
        cd ${srcdir}/lighttpd-${pkgver}
        make DESTDIR=${pkgdir} install

        install -D -m755 ${srcdir}/lighttpd.rc.d ${pkgdir}/etc/rc.d/lighttpd
        install -D -m644 ${srcdir}/lighttpd.logrotate.d ${pkgdir}/etc/logrotate.d/lighttpd
        install -D -m644 ${srcdir}/lighttpd.conf ${pkgdir}/etc/lighttpd/lighttpd.conf
        install -d -m755 -o http -g http ${pkgdir}/var/{run,log,cache}/lighttpd/

        pushd doc/config >/dev/null
        find . -type f ! -name 'Makefile*' -exec install -D -m644 {} $pkgdir/usr/share/doc/lighttpd/config/{} \;
        popd >/dev/null

        pushd doc >/dev/null
        find . -maxdepth 1 -type f -name '*.txt' -exec install -D -m644 {} $pkgdir/usr/share/doc/lighttpd/{} \;
        popd >/dev/null

        install -D -m644 COPYING ${pkgdir}/usr/share/licenses/lighttpd/COPYING

        echo -e "\n\nMore information about H264 Streaming Module: http://h264.code-shop.com/trac"
	echo -e "\nNon-Commercial License: http://creativecommons.org/licenses/by-nc-sa/3.0/"
	echo -e "\nCommercial License: http://h264.code-shop.com/trac/wiki/Mod-H264-Streaming-License-Version2\n\n"
}
