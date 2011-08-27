pkgname=ttf-meslo-dz
pkgver=1.0
pkgrel=1
pkgdesc="Meslo DZ (Dotted-Zero) Font"
arch=('any')
url="http://github.com/andreberg/Meslo-Font"
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/downloads/andreberg/Meslo-Font/Meslo%20LG%20DZ%20v1.0.zip)
md5sums=('14137a04d3375bc0800013f96741e6d9')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/Meslo\ LG\ DZ\ v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
}

