# Contributor: <thenoob06@gmail.com>
pkgname=homeplayer
_realname=HomePlayer
pkgver=1.5.7e
pkgrel=1
pkgdesc="An application to use with french ISP 'Free's triple-play box to enhance it."
arch=(i686 x86_64)
url="http://homeplayer.free.fr/"
license="GPL"
depends=('jre' 'vlc')
source=(http://freefr.dl.sourceforge.net/sourceforge/homeplayer/${_realname}-${pkgver}.zip)
md5sums=('027f82624f6460c5de29cf9b389939c4')

build() {

cd ${startdir}/src/
sed -i.bak 's/`which java`/\"\/opt\/java\/jre\/bin\/java\"/' homeplayer.sh
install -d -m755 $startdir/pkg/opt/$pkgname
cp $startdir/src/* $startdir/pkg/opt/$pkgname/ -R
install -d -m777 $startdir/pkg/opt/$pkgname/work

}
