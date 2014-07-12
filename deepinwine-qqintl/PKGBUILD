#Maintainer: Mingkai Dong <mingkaidong [at] gmail.com>

pkgname=deepinwine-qqintl
pkgver=0.1.3
pkgrel=1
pkgdesc='wine version of QQintl client, modified from Deepin Team"s version.'
arch=('i686' 'x86_64')
url='http://www.imqq.com/'
license=('Other')
source=("deepinwine-qqintl_0.1.3.orig.tar.xz::http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-qqintl/deepinwine-qqintl_0.1.3.orig.tar.xz")
md5sums=('26c29532141784c7f1ce3c4ff17a1054' )

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
fi

package()
{
    datadir=${pkgdir}/usr/share/deepinwine/
    mkdir -p ${datadir}
    tar xvf deepinwine-qqintl_0.1.3.orig.tar.xz -C ${datadir}

    icondir=${pkgdir}/usr/share/icons/hicolor/48x48/apps/
    mkdir -p ${icondir}
    cp ${datadir}icons/qqintl.png ${icondir}

    desktopdir=${pkgdir}/usr/share/applications/
    mkdir -p ${desktopdir}
    cp ${datadir}qqintl.desktop ${desktopdir}

    bindir=${pkgdir}/usr/bin/
    mkdir -p ${bindir}
    ln -s /usr/share/deepinwine/qqintl/wine-qqintl ${bindir}wine-qqintl
}
