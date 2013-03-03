# Contributor: James Boocock <sfk2001@gmail.com>
# Maintainer : James Boocock <sfk2001@gmail.com>
pkgname=plink
pkgver=1.07
pkgrel=1
pkgdesc="Plink is a free open-source whole genome association analysis toolset"
arch=('x86_64' 'i686')
url=("http://pngu.mgh.harvard.edu/~purcell/plink/index.shtml")
license=("GPL")
groups=()
depends=('unzip')
source=("http://pngu.mgh.harvard.edu/~purcell/${pkgname}/dist/${pkgname}-${pkgver}-src.zip" "package.patch")
md5sums=('4566376791df4e69459b849bd7078fa3'
         'a17936ec18094f594d345043405718ca')

build(){
   cd $srcdir/${pkgname}-${pkgver}-src
   patch -p1 < $srcdir/package.patch
   make
}

package(){
    cd "$srcdir/${pkgname}-${pkgver}-src"
    PREFIX="$pkgdir/usr/"
    mkdir -p $PREFIX/bin 
    cp plink $PREFIX/bin
}

