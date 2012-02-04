# Maintainer : 
# Contributor: Hendrik Sticher <hendrik_sticher@gmx.de>

pkgname=udrec
pkgver=0.12q
pkgrel=1
pkgdesc="Linux@DBox2-Streaming for Windows and Linux"
url="http://www.haraldmaiss.de/"
depends=('mono')
makedepends=()
source=(http://www.haraldmaiss.de/$pkgname$pkgver.zip patch-Record.cs udrec)
md5sums=('c6d620fa69e8674edb0a466c49d17080' '2963e1e44313b9dc2b2a2a7ec26c307b'\
         '1e909b14903acd3e80da606c726e34a5')
conflicts=()
provides=()

build()
{
    cd $startdir/src/src
    patch -p0 < ../patch-Record.cs
    mcs -o udrec.exe *.cs
    mkdir -p $startdir/pkg/usr/bin
    install $startdir/src/src/udrec.exe $startdir/pkg/usr/bin
    install $startdir/src/udrec $startdir/pkg/usr/bin 
}

