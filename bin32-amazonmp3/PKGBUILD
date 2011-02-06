# Contributor: Chris Schwaab christopher.schwaab gmail
pkgname=bin32-amazonmp3
pkgver=1.0.3
pkgrel=3
pkgdesc="The MP3 downloader with self contained library deps for amd64."
url="http://www.amazon.com/gp/dmusic/help/amd.html"
arch=('x86_64')
license=('custom')
depends=('bash' 'lib32-libxdamage' 'lib32-curl' 'lib32-pango' 'lib32-gtk2'
         'lib32-libpng12')
makedepends=('deb2targz')
provides=('amazonmp3')
conflicts=('amazonmp3')
replaces=('amazonmp3-amd64')

source=('http://mirrors.kernel.org/ubuntu/pool/main/g/gtkmm2.4/libgtkmm-2.4-1c2a_2.14.1-0ubuntu1_i386.deb'
        'http://mirrors.kernel.org/ubuntu/pool/main/c/cairomm/libcairomm-1.0-1_1.8.0-1build1_i386.deb'
        'http://mirrors.kernel.org/ubuntu/pool/main/g/glibmm2.4/libglibmm-2.4-1c2a_2.16.4-0ubuntu1_i386.deb'
        'http://mirrors.kernel.org/ubuntu/pool/main/p/pangomm/libpangomm-1.4-1_2.24.0-1_i386.deb'
        'http://mirrors.kernel.org/ubuntu/pool/main/libs/libsigc++-2.0/libsigc++-2.0-0c2a_2.0.17-2ubuntu3_i386.deb'
        'http://security.ubuntu.com/ubuntu/pool/universe/b/boost/libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb'
        'http://security.ubuntu.com/ubuntu/pool/universe/b/boost/libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb'
        'http://security.ubuntu.com/ubuntu/pool/universe/b/boost/libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb'
        'http://security.ubuntu.com/ubuntu/pool/universe/b/boost/libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb'
        'http://amazonm-002.vo.llnwd.net/u/d1/clients/amazonmp3_1.0.3~gutsy_i386.deb'
        'http://security.ubuntu.com/ubuntu/pool/main/b/bzip2/libbz2-1.0_1.0.4-2ubuntu4_i386.deb')

md5sums=('9f57c64d4cc07f52605f22f28b805c03'
         '3f36242c965cea7b79853aec5284c698'
         '3cf0dd57b78d00b0681e9c38b9519e5e'
         'eb9c503696acbb1318d7466da764b9af'
         '0a314b01a63155be5b5248807b23ea05'
         '8a92592ff53bfd88e4ef30702bc3a5c0'
         '1c1e73957bb3df7991b8ba625e42dc3e'
         'ab12bd95053d2dfaf5384b8fec0ef928'
         '718b975d711d3e3d7d7288a1ca73fae4'
         '0a9b986e2e9ba5be7e412e9742688ebb'
         'cc754012baa0d400bd15811c93aa735e')

build() {
        deb2targz libgtkmm-2.4-1c2a_2.14.1-0ubuntu1_i386.deb \
                  libcairomm-1.0-1_1.8.0-1build1_i386.deb \
                  libglibmm-2.4-1c2a_2.16.4-0ubuntu1_i386.deb \
                  libpangomm-1.4-1_2.24.0-1_i386.deb \
                  libsigc++-2.0-0c2a_2.0.17-2ubuntu3_i386.deb \
                  libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb \
                  libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb \
                  libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb \
                  libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb \
                  libbz2-1.0_1.0.4-2ubuntu4_i386.deb \
                  amazonmp3_1.0.3~gutsy_i386.deb || return 1

        tar -xzf libgtkmm-2.4-1c2a_2.14.1-0ubuntu1_i386.tar.gz || return 1
        tar -xzf libcairomm-1.0-1_1.8.0-1build1_i386.tar.gz || return 1
        tar -xzf libglibmm-2.4-1c2a_2.16.4-0ubuntu1_i386.tar.gz || return 1
        tar -xzf libpangomm-1.4-1_2.24.0-1_i386.tar.gz || return 1
        tar -xzf libsigc++-2.0-0c2a_2.0.17-2ubuntu3_i386.tar.gz || return 1
        tar -xzf libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
        tar -xzf libboost-signals1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
        tar -xzf libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
        tar -xzf libboost-thread1.34.1_1.34.1-4ubuntu3_i386.tar.gz || return 1
        tar -xzf libbz2-1.0_1.0.4-2ubuntu4_i386.tar.gz || return 1
        tar -zxf amazonmp3_1.0.3~gutsy_i386.tar.gz || return 1

        mkdir -p $pkgdir/opt/amazonmp3
        mkdir -p $pkgdir/usr/share/doc/amazonmp3
        mkdir -p $pkgdir/usr/share/mime-info/

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
