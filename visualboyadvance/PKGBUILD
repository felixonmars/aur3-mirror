# Maintainer: Juan Pablo Santos <santos(dot)REMOVETHISjuanpablo(at)gmail(dot)com>
pkgname='visualboyadvance'
pkgver='1.8.0.dfsg'
pkgrel=1
pkgdesc='Emulator for VBA'
url="http://sourceforge.net/projects/vba/"
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('automake-1.7')
depends=('sdl' 'gtk2' 'gtkmm')
install=${pkgname}.install
source=("http://ftp.us.debian.org/debian/pool/main/v/visualboyadvance/${pkgname}_${pkgver}.orig.tar.gz"
        "http://ftp.us.debian.org/debian/pool/main/v/visualboyadvance/${pkgname}_${pkgver}-2.debian.tar.gz")
md5sums=('f939b3700c7e2519a420e7f4da843e03'
                 '59a313867f09f0d7054a2b703883d201')
prepare() {
    cp $srcdir/debian/patches/*.patch $srcdir/VisualBoyAdvance-1.8.0/
    pushd $srcdir/VisualBoyAdvance-1.8.0
    patch -p1 < 01_use_dot_dir.patch
    patch -p1 < 02_amd64_build_fix.patch
    patch -p1 < 03_translation_swedish.patch
    patch -p1 < 04_fix_gtk_with_DBKPT_SUPPORT.patch
    patch -p1 < 05_translation_brazilian.patch
    patch -p1 < 07_update_autoconf_macros.patch
    patch -p1 < 08_gvba_load_gb_rom.patch
    patch -p1 < 09_deprecatedsigc++.patch
    patch -p1 < 10_fix_typecast.patch
    patch -p1 < 11_libpng1.5.patch
    patch -p1 < 12_vba-linux-sdl.patch
    patch -p1 < 13_debugger_format.patch
    patch -p1 < 14_dont_rebuild_po_files.patch
    
    pushd $srcdir/VisualBoyAdvance-1.8.0/po
    
    for f in $(ls *.po | sed 's/.po//'); do
        msgfmt -o $f.gmo $f.po
    done
    
    popd
    popd
}

build() {
    pushd $srcdir/VisualBoyAdvance-1.8.0/
    ./configure --enable-gtk=2.4 --without-mmx --prefix=/usr
    make
    popd
}

package() {
    pushd $srcdir/VisualBoyAdvance-1.8.0/
    make DESTDIR=$pkgdir install
    mkdir $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications 
    cp $srcdir/debian/VisualBoyAdvance-gtk-32x32.xpm $pkgdir/usr/share/pixmaps/
    cp $srcdir/debian/VisualBoyAdvance.desktop $pkgdir/usr/share/applications/
}
