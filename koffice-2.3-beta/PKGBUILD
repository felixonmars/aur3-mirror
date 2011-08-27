# Contributor:  Zinchenko Andrij <andrez@greencubator.info>

pkgname=koffice-2.3-beta
pkgver=2.2.91
pkgrel=1
pkgdesc="The 2.3 RC1 version of the free, integrated office suite for KDE, the K Desktop Environment"
url="http://www.koffice.org/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-runtime' 'kdepimlibs' 'glew' 'exiv2>=0.18' 'libwpd' 'gsl' 'wv2' 'qca' 'poppler-qt' 'qimageblitz' 'lcms' 'xdg-utils' 'shared-mime-info' 'pstoedit' 'graphicsmagick' 'docbook-xml')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'eigen')
conflicts=('koffice')
provides=('koffice')

source=(ftp://ftp.xcp.kiev.ua/ftp.kde.org/unstable/koffice-2.2.91/koffice-2.2.91.tar.bz2)
md5sums=(ec3c1cb66552ccd6d6049f58bf3a21db)

build() {
        
        cd "$srcdir/koffice-$pkgver"
        [ -d 'build' ] &&  rm -rf build
        mkdir build
        cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
        make || return 1
        make DESTDIR="$pkgdir/" install || return 1
}