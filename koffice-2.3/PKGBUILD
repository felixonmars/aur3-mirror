# Contributor:  Zinchenko Andrij <andrez@greencubator.info>

pkgname=koffice-2.3
pkgver=2.3.0
pkgrel=1
pkgdesc="The 2.3 version of the free, integrated office suite for KDE, the K Desktop Environment"
url="http://www.koffice.org/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-runtime' 'kdepimlibs' 'glew' 'exiv2>=0.18' 'libwpd' 'gsl' 'wv2' 'qca' 'poppler-qt' 'qimageblitz' 'lcms' 'xdg-utils' 'shared-mime-info' 'pstoedit' 'graphicsmagick' 'docbook-xml')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'eigen')
conflicts=('koffice')
provides=('koffice')

source=(ftp://ftp.xcp.kiev.ua/ftp.kde.org/stable/koffice-2.3.0/koffice-2.3.0.tar.bz2)
md5sums=(4f99a44b004e4a237890e0834a09964b)

build() {
        
        cd "$srcdir/koffice-$pkgver"
        [ -d 'build' ] &&  rm -rf build
        mkdir build
        cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
        make || return 1
        make DESTDIR="$pkgdir/" install || return 1
}