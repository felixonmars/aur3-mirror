# Contributor: CJ Niemira <siege@siege.org>
pkgname=tkxext
pkgver=3.6.12
pkgrel=1
pkgdesc="An extension to Tcl/Tk that provides the abilities to embed foreign applications (based on their title), record events to a script, and playback that script."
arch=('i686', 'x86_64')
url="http://www.xmission.com/~georgeps/implementation/software/TkXext/"
license=('bsd')
depends=('tk>=8.5')
source=($url/TkXext-$pkgver.tar.bz2)
md5sums=('dc44cb488db021d1dd795d5d649efa68')

build() {
  cd $startdir/src/TkXext-$pkgver

  perl -pi -e "s/\d+.\d+.\d+/$pkgver/g" pkgIndex.tcl

  perl -pi -e "s/\d+.\d+.\d+/$pkgver/g" build.conf
  perl -pi -e 's/\/gps\/runtime8\.4/\/usr/g' build.conf
  perl -pi -e 's/84/8\.5/g' build.conf
  tclsh build.tcl

  mkdir -p $startdir/pkg/usr/lib/$pkgname$pkgver
  install -m 755 TkXext.so $startdir/pkg/usr/lib/$pkgname$pkgver
  install -m 644 pkgIndex.tcl $startdir/pkg/usr/lib/$pkgname$pkgver

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  install -m 444 LICENSE $startdir/pkg/usr/share/licenses/$pkgname
}
