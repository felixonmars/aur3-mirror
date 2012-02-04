# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>
# Maintainer:  Gimmeapill <gimmeapill at gmail DOT com>

pkgname=hdjcpl
pkgver=1.09
pkgrel=3
pkgdesc="Hercules DJ Control Panel let you control the Hercules DJ hardware settings"
arch=('i686' 'x86_64')
url="http://ts.hercules.com/eng/"
license=('Custom')
makedepends=('rpmextract')
depends=('hdjmod')
source=('ftp://ftp.hercules.com/pub/webupdate/DJCSeries/Hercules_DJSeries_Linux.tgz')
md5sums=('498cf0ff144f20106718932ab22571ce')

build() {
	cd $srcdir
    if [ "$CARCH" = "x86_64" ]; then
      cd  $srcdir/Control\ Panel
      rpmextract.sh hdjcpl-1.09-1.x86_64.rpm
      cp -r usr $pkgdir
    else
      cd  $srcdir/Control\ Panel
      rpmextract.sh hdjcpl-1.09-1.i386.rpm
      cp -r usr $pkgdir
    fi
}


