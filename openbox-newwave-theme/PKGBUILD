# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=openbox-newwave-theme
_tname="NewWave4OB"
pkgver=2009.04.26
pkgrel=1
pkgdesc="Simple White OpenBox Theme"
arch=('any')
url="http://box-look.org/content/show.php/New+Wave+OB?content=103527"
license=('GPL')
depends=('openbox>=3.0')
makedepends=('imagemagick')
source=(http://box-look.org/CONTENT/content-files/103527-$_tname.obt
        $_tname-Grey.patch)
noextract=("103527-$_tname.obt")
md5sums=('38de16a31cd2d1435f2baec8bc112ace'
         'a1035ac8fa5b8ae3f10c77a7aed2d71d')

build() {
  cd $srcdir
  tar -zxf 103527-$_tname.obt
  cp -r $_tname $_tname-Grey
  cd $_tname-Grey/openbox-3
  patch -Np1 -i $srcdir/$_tname-Grey.patch || return 1
  for _img in *xbm ; do
    convert -fx G ${_img} ${_img}
  done
  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/$_tname $pkgdir/usr/share/themes/
  cp -r $srcdir/$_tname-Grey $pkgdir/usr/share/themes/
}
