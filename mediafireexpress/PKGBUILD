# Maintainer: Carlos Monzon <kr105.v07now@gmail.com>
pkgname=mediafireexpress
pkgver=0.15.4.4888
pkgrel=1
pkgdesc="File Uploader for MediaFire"
arch=('i686' 'x86_64')
url="http://www.mediafire.com/software/express/tour.php"
license=('unknown')
depends=('curl' 'expat' 'perl' 'gcc' 'gcc-libs' 'libstdc++5' 'qt4')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('1a3edfb44ad090176a394cb02ec9b426')
else
    ARCH='i386'
    md5sums=('b4892f046e7c2e8e6a4f641fe536d2c5')
fi

source=(http://kr105.shekalug.org/packages/MediaFireExpress_$pkgver-linux_$ARCH.deb)

build() {
    msg "Extracting..."
    ar -xv MediaFireExpress_$pkgver-linux_$ARCH.deb || return 1
    tar -xvf data.tar.gz || return 1
    msg2 "Extraccion Correcta!"
    msg "Moviendo los archivos"
    mv $srcdir/etc $pkgdir
    mv $srcdir/opt $pkgdir
    mv $srcdir/usr $pkgdir
    msg2 "Completado."
}
