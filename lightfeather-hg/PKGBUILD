# Contributor: Abdallah Aly <l3thal8@gmail.com>

pkgname=lightfeather-hg
pkgver=0.8.5
pkgrel=1
pkgdesc="Lightfeather is an open source 3D Engine for Mac, Windows and Linux."
arch=(i686 x86_64)
url="http://lightfeather.de"
license=('GPL')
#groups=()
depends=()
makedepends=('mercurial')
provides=(lightfeather)
conflicts=(lightfeather)
#replaces=()
#backup=()
#options=()
#install=
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
md5sums=() #generate with 'makepkg -g'

_hgtrunk=http://anonymous:guest@lightfeather.de/cgi-bin/hg/lightfeather
_hgmod=lightfeather

build() {

cd "$srcdir"

msg "pulling the hg repo"

#if [ -d $_hgmod ] ; then
#rm -r $_hgmod
#fi

hg clone $_hgtrunk $_hgmod

cd $_hgmod

msg "Starting configure and make..."

./autogen.sh

mkdir $pkgdir/opt/lightfeather/

#make install prefix=$pkgdir/opt/lightfeather/

make install prefix=$pkgdir/usr

cp -r $srcdir/$_hgmod/examples $pkgdir/usr/share/lightfeather/

}
