#Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe6
_pkgname=ipe
_sfproject=ipe7
pkgver=6.0.32
pkgrel=2
pkgnamever=6.0pre32patch1
pkgdesc="The Ipe extensible drawing editor"
url="http://tclab.kaist.ac.kr/ipe/"
#depends=('qt' 'freetype2' 'zlib' 'texlive-bin' 'qhull')
depends=('qt' 'freetype2' 'zlib' 'qhull')
arch=('i686' 'ppc' 'x86_64')
license="GPL"
ftiversion_=20080517
ptiversion_=20070509
source=(http://downloads.sourceforge.net/project/$_sfproject/zzz_archived_files/$_pkgname-$pkgnamever-src.tar.gz
        http://downloads.sourceforge.net/project/$_sfproject/tools/figtoipe-$ftiversion_.tar.gz
        http://downloads.sourceforge.net/project/$_sfproject/zzz_archived_files/pdftoipe-$ptiversion_.tar.gz
        http://www.vanwal.nl/ebuilds/files/dlgpage.patch
        http://www.vanwal.nl/ebuilds/files/dlgtext.patch
        http://www.vanwal.nl/ebuilds/files/editorfont.patch
        http://www.vanwal.nl/ebuilds/files/editorfont_preamble.patch
        # http://www.vanwal.nl/ebuilds/files/round_bug.patch
        http://www.vanwal.nl/ebuilds/files/undo_view_change.patch
        )
md5sums=('2d979ee33944452b7ba18a0ba7c176f3'
         '2db958443d8dc7e4a8f73d084e74177b'
         'de7df6f3a98f92e08323d3b774c69b34'
         '26fb08ca605c2b7aa1343592112dfcb6'
         '838d21cb3560de465f3548a6db0c8362'
         '4305956558a87b92096acee057fc5be1'
         '20552c7d3ecb60abcf91d3f87aaf3c45'
         # 'ce0aa53e66ddd035d24e3e3a1e50a29a'
         '981c7463979e81d0bf263130872cebbf')

build() {
 # Build Ipe
 cd $startdir/src/$_pkgname-$pkgnamever/src
 
 patch -p1 < $startdir/dlgpage.patch
 patch -p1 < $startdir/dlgtext.patch
 patch -p1 < $startdir/editorfont.patch
 patch -p1 < $startdir/editorfont_preamble.patch
 # patch -p1 < $startdir/round_bug.patch
 patch -p1 < $startdir/undo_view_change.patch

 qmake IPEPREFIX=/usr
 make || return 1
 INSTALL_ROOT=$startdir/pkg make install
 sed -i 's@/usr/share/texmf@/opt/texlive/texmf-dist@g' ../tetex-fontmap.xml
 install -D -m644 ../tetex-fontmap.xml $startdir/pkg/usr/share/ipe/$pkgnamever/fontmap.xml

 # Make QVoronoi Ipelet
 cd $startdir/src/$_pkgname-$pkgnamever/src/ipelets/qvoronoi
 qmake IPEPREFIX=/usr INCLUDEPATH+=/usr/include/qhull
 make || return 1
 INSTALL_ROOT=$startdir/pkg make install

 # Build figtoipe
 cd $startdir/src/figtoipe-$ftiversion_
 make || return 1
 cp figtoipe $startdir/pkg/usr/bin

 # Build pdftoipe
 cd $startdir/src/pdftoipe-$ptiversion_
 qmake
 make || return 1
 cp pdftoipe $startdir/pkg/usr/bin
} 
