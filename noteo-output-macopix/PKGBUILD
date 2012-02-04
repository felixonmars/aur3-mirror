# Contributor: Arnaud Barisain Monrose <dreamteam69@gmail.com>
# noteo by Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-output-macopix
pkgver=0.0.6
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="A noteo output module which uses macopix."
url="http://dreamteam69.free.fr/arch/devel/noteo-output-macopix/"
license=("GPL")
depends=("noteo>=0.0.6" "macopix")
provides=() 
conflicts=("noteo-notify-macopix")
install=noteo-output-macopix.install
source=("http://dreamteam69.free.fr/arch/devel/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d2128e7f5d67c04b416b4b99770e564')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv Macopix $startdir/pkg/usr/share/noteo/
}
