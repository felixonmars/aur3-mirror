#Maintainer: lspci <agm2819[a  t]g    m  a i l[dot] c_o  m>
#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=gursormaker
pkgver=0.6.0
pkgrel=6
pkgdesc="Graphical user interface that allows manipulating cursor themes for X11"
url="http://gursormaker.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('python' 'pygtk' 'xorg-xcursorgen')
makedepends=('rpl')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2?r=http%3A%2F%2F$pkgname.sourceforge.net%2F&ts=1347368603&use_mirror=superb-sea2")
md5sums=('52d2ead2a3b9872fe79ab28164b59f1d')

build() {
mkdir -p $startdir/pkg/usr/bin/
cd $startdir/src/$pkgname-$pkgver/
cd GursorMaker/
rpl "Queue" "queue" *
cd ../
python setup.py install --root=$startdir/pkg
}
