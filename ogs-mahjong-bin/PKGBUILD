# Maintainer: hickop <hickop@gmail.com>

pkgname=ogs-mahjong-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple mahjong solitaire with 3D and relaxing soundtrack. (binary)"
arch=('i686' 'x86_64')
url="http://www.opengamestudio.org"
license=('GPL')
depends=('freeglut' 'freeimage' 'libidn' 'libvorbis' 'libxaw' 'openal' 'xdg-utils')
_arch=32
[ "$CARCH" == 'x86_64' ] && _arch=64
source=("http://sourceforge.net/projects/osrpgcreation/files/Mahjong/$pkgver/ogs-mahjong-$pkgver-linux$_arch.tar.lzma"
        'ogs-mahjong'
        'ogs-mahjong.desktop')
md5sums=('a4f8c5181d78615b0f3d31c4d2143692'
         '756556e00ca27a413f1f439ef7884d50'
         '69854635ca4338f09c8ab6cd5fd24489')
[ "$_arch" == '64' ] && md5sums[0]='c551ea63906371aab7f19c91ce165f8e'

package() {
    install -d $pkgdir/opt/ogs-mahjong/
    cp -r $srcdir/ogs-mahjong-$pkgver-linux$_arch/* $pkgdir/opt/ogs-mahjong/

    # Link required crypto libraries.
    ln -s /usr/lib/libpcre.so $pkgdir/opt/ogs-mahjong/lib/libpcre.so.3

    # Remove starting script.
    rm $pkgdir/opt/ogs-mahjong/mj

    chmod 755 $pkgdir/opt/ogs-mahjong/lib/mj-bin

    # Install executable, desktop file and icon.
    install -Dm755 $srcdir/ogs-mahjong $pkgdir/usr/bin/ogs-mahjong
    install -Dm644 $srcdir/ogs-mahjong.desktop $pkgdir/usr/share/applications/ogs-mahjong.desktop
    install -Dm644 $srcdir/ogs-mahjong-$pkgver-linux$_arch/res/GLX_icon.png $pkgdir/usr/share/pixmaps/ogs-mahjong.png
}
