# Old Contributor: Chris Schwaab christopher.schwaab gmail
# Adapter for i686 by Roger Braun
# Old Contributor: twa022 <twa022@gmail.com>
# Contributor: jwbwater <jwbwater@gmail.com>
pkgname=amazonmp3
pkgver=1.0.3
pkgrel=3
pkgdesc="The Amazon MP3 downloader"
url="http://www.amazon.com/gp/dmusic/help/amd.html"
arch=('i686')
license=('custom')
depends=('bash' 'libxdamage' 'curl' 'pango' 'gtk2' 'openssl098' 'gtkmm' 'pangomm' 'cairomm' 'glibmm' 'libsigc++' 'bzip2')
makedepends=('deb2targz')
source=('http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://amazonm-002.vo.llnwd.net/u/d1/clients/amazonmp3_1.0.3~gutsy_i386.deb')

md5sums=('8a92592ff53bfd88e4ef30702bc3a5c0' \
	'ab12bd95053d2dfaf5384b8fec0ef928' \
	'1c1e73957bb3df7991b8ba625e42dc3e' \
	'718b975d711d3e3d7d7288a1ca73fae4' \
	'0a9b986e2e9ba5be7e412e9742688ebb')

build() {
	deb2targz libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb || return 1
	deb2targz libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb || return 1
	deb2targz libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb || return 1
	deb2targz libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb || return 1
        deb2targz amazonmp3_1.0.3~gutsy_i386.deb || return 1

	tar -zxf libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
	tar -zxf libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
	tar -zxf libboost-signals1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
	tar -zxf libboost-thread1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
        tar -zxf amazonmp3_1.0.3~gutsy_i386.tar.gz || return 1

        mkdir -p $pkgdir/opt/amazonmp3
        mkdir -p $pkgdir/usr/share/doc/amazonmp3
        mkdir -p $pkgdir/usr/share/mime-info/
        mkdir -p lib

	tar -cf - -C lib ./ | tar -xf - -C $pkgdir/opt/amazonmp3 || return 1
	tar -cf - -C usr/lib ./ | tar -xf - -C $pkgdir/opt/amazonmp3 || return 1

        cat > amazonmp3 <<__EOF__
#!/bin/bash
export GTK_PATH=/opt/lib32/usr/lib/gtk-2.0
export GDK_PIXBUF_MODULE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
export PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
export LD_LIBRARY_PATH=/opt/lib32/usr/lib:/opt/amazonmp3:\$LD_LIBRARY_PATH
/opt/amazonmp3/amazonmp3 "$@"
__EOF__

        install -D -m644 usr/share/doc/amazonmp3/license.html \
                         $pkgdir/usr/share/licenses/amazonmp3-amd64/license.html || return 1
        install -D -m755 amazonmp3 $pkgdir/usr/bin/amazonmp3 || return 1
        install -D -m755 usr/bin/amazonmp3 $pkgdir/opt/amazonmp3/amazonmp3 || return 1
        install -D -m644 usr/share/applications/amazonmp3.desktop \
                         $pkgdir/usr/share/applications/amazonmp3.desktop || return 1
        install -D -m644 usr/share/doc/amazonmp3/* \
                         $pkgdir/usr/share/doc/amazonmp3 || return 1
        install -D -m644 usr/share/mime/packages/amazonmp3.xml \
                         $pkgdir/usr/share/mime/packages/amazonmp3.xml || return 1
        install -D -m644 usr/share/mime-info/*  \
                         $pkgdir/usr/share/mime-info/ || return 1
        install -D -m644 usr/share/mimelnk/audio/x-amzxml.desktop \
                         $pkgdir/usr/share/mimelnk/audio/x-amzxml.desktop || return 1
        install -D -m644 usr/share/pixmaps/amazonmp3.png \
                         $pkgdir/usr/share/pixmaps/amazonmp3.png || return 1
}
