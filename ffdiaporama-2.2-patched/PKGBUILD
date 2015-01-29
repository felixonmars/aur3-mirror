    # Maintainer: boenki <boenki at gmx dot de>
    # Patched by : The manjaro.fr friendly-devs <http://manjaro.fr> 
    pkgname=ffdiaporama-2.2-patched
    pkgver=2.2
    pkgrel=1
    pkgdesc="Movie creator from photos and video clips"
    arch=('i686' 'x86_64')
    url="http://ffdiaporama.tuxfamily.org"
    license=('GPL2')
    conflicts=('ffdiaporama-devel')
    depends=('qt5-svg' 'qt5-tools' 'qt5-imageformats' 'ffmpeg' 'exiv2' 'shared-mime-info' 'qt5-multimedia')
    optdepends=('ffdiaporama-texturemate: Additional background-images'
                'ffdiaporama-openclipart: use the openclipart-library')
    #install=$pkgname.install
    source=(http://ffdiaporama.tuxfamily.org/script/GetPackage.php?f=ffdiaporama_bin_2.2.devel.2014.0701.tar.gz
            https://sourceforge.net/projects/ffdiaporamadevel22patch/files/ffmpeg-2.5.0.patch.tar.gz)

    sha256sums=('3523bde8b3f657dbc48efe8f55357de45c2c5a016e65c6744194d91b29c5347b'
                'c5fcfc68b5ca107a2d017c0ba181800cbd79abb847546507fba7a9a601bf7654')

    build() {
          cd $srcdir/ffDiaporama
          patch -p0 -l <../ffmpeg-2.5.0.patch
          qmake-qt5 ffDiaporama.pro
          make
           }
           
    package() {
          cd $srcdir/ffDiaporama
          make install INSTALL_ROOT=$pkgdir
          find $pkgdir/usr/share -type f -exec chmod 644 {} +   
          }

