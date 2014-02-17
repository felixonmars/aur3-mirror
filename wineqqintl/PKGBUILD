#Maintainer: Mingkai Dong <mingkaidong [at] gmail.com>

pkgname=wineqqintl
pkgver=20140122
pkgrel=1
pkgdesc='wine version of QQintl client, modified from Longene Team"s version.'
arch=('i686' 'x86_64')
url='http://www.imqq.com/'
license=('Other')
source=("wineqqintl2.11.tar.gz::http://ubuntuone.com/4Q1GoN90HRvdLkgFhDMNpF")
md5sums=('a22fab23e438d7685c644cc0af21d1c0' )

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
fi

package()
{
	#tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
    tar xzvf wineqqintl2.11.tar.gz -C ${pkgdir}/
}
