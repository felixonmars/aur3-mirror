pkgname=llvm-compiler-rt-svn
pkgver=82627
pkgrel=2
pkgdesc="A simple library that provides an implementation of the low-level target-specific hooks required by code generation and other runtime components of llvm."
url="http://compiler-rt.llvm.org/index.html"
arch=('i686')
license=('LLVM')
depends=()
makedepends=('svn' 'cmake')
provides=('llvm-compiler-rt')

source=()
md5sums=()

_svntrunk=http://llvm.org/svn/llvm-project/compiler-rt/trunk
_svnmod=compiler-rt

build(){
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ../compiler-rt
    make || return 1
    install -d ${pkgdir}/usr/lib/ || return 1
    install -d ${pkgdir}/usr/include/ || return 1
    install ${srcdir}/build/BlocksRuntime/libBlocksRuntime.so ${pkgdir}/usr/lib/ || return 1
    install ${srcdir}/compiler-rt/BlocksRuntime/*.h ${pkgdir}/usr/include/ || return 1
    
}
