#Maintainer: lang2 <wenzhi.liang@gmail.com>
#Contributor: Daniel Neve <the dot mephit at googlemail dot com>

pkgname=putmail
pkgver=1.4
pkgrel=3
pkgdesc="a very lightweight MTA or SMTP client that may replace the sendmail command"
url="http://putmail.sourceforge.net/"
depends=('python')
arch=(i686 x86_64)
license=('MIT')
source=(http://downloads.sourceforge.net/project/putmail/putmail.py/$pkgver/putmail.py-${pkgver}.tar.bz2)
md5sums=('cb512effdb98731821b09dedcbc641ed')

build()
{
	tmp_file=pm-py.$$
	cd $startdir/src/$pkgname.py-$pkgver
	PREFIX=$startdir/pkg/usr ./install.sh
}
