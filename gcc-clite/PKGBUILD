pkgname=gcc-clite
pkgver=0.3
pkgrel=1
pkgdesc="Experimental GCC branch implementing C++ Concepts Lite proposal"
arch=('any')
url="http://concepts.axiomatics.org/~ans/"
license=('unknown')

depends=()
options=('!strip')
source=('http://concepts.axiomatics.org/~ans/gcc-clite-0.3.tar.bz2')                                                                
md5sums=("a3bf31f4f216f91faa0eaf523df571bb")

package()
{
    mkdir build
    cd build

    # Patch texinfo >= 5.0 issues. See https://gcc.gnu.org/bugzilla/attachment.cgi?id=29520&action=diff
    sed -i -- 's/@itemx/@item/g' ../gcc-clite-0.3/gcc/doc/*.texi

    # Configure (Note --disable.werror)
    ../gcc-clite-0.3/configure --disable-werror --program-suffix=-clite --program-transform-name='s/^gcc$/gcc-clite/g' --enable-languages=c++

    make
    make install
}