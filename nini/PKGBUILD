# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: MutantMonkey <mutantmonkey@gmail.com>
# Contributor: Madek <gonzaloseguel@gmail.com>

pkgname=nini
_pkgname=Nini
pkgver=1.1.0
pkgrel=3
pkgdesc="An uncommonly powerful .NET configuration library designed to help build highly configurable applications quickly"
arch=('any')
url="http://nini.sourceforge.net/"
license=('MIT')
depends=('mono')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/$pkgname/$_pkgname-$pkgver.zip
        $pkgname-1.1.pc)
md5sums=('63384f75fabd401cff1500f738d452f4'
         '6e2cabea421a72247d4f1cdf1ffac9b6')

build() {
  cd "$srcdir/$_pkgname"

  sn -k $_pkgname.snk
  gmcs -t:library -out:Bin/$_pkgname.dll -keyfile:$_pkgname.snk \
       -r:System,System.Data,System.Xml \
       Source/{AssemblyInfo,Config/*,/Ini/*,/Util/*}.cs
}

package() {
  cd "$srcdir/$_pkgname"

  gacutil -i Bin/$_pkgname.dll -package $_pkgname -root $pkgdir/usr/lib/
  install -Dm644 $srcdir/$pkgname-1.1.pc $pkgdir/usr/lib/pkgconfig/$pkgname-1.1.pc
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
