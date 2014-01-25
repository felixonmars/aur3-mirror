#Maintainer: Jove Yu <yushijun110 [at] gmail.com>

pkgname=wineqq
pkgver=20140102
pkgrel=1
pkgdesc='wine version of QQ client,made by Longene Team.'
arch=('i686' 'x86_64')
url='http://www.longene.org/'
license=('Other')
#source=("http://www.longene.org/download/WineQQ2013-${pkgver}-Longene.deb")
source=("http://www.longene.org/download/WineQQ2013SP6-20140102-Longene.deb")
md5sums=('485e5632110eff23e215edf2f07cd04a')

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
fi

PKGEXT=".pkg.tar"

package()
{
	tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
