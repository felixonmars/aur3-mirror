# Maintainer: Martin Schulze <mail dot martin dot schulze at gmx dot net>
pkgname=templight2
pkgver=2.0.r13.4139747
pkgrel=1
pkgdesc="C++ Template debugger/profiler based on clang"
url="https://github.com/mikael-s-persson/templight"
arch=('i686' 'x86_64')
license=('UIUC')
depends=('ocaml' 'swig' 'libedit')
makedepends=('subversion' 'cmake' 'python2' 'libffi')
provides=('templight')
optdepends=('templar-schulmar-git')
conflicts=()

source=("llvm"::'svn+http://llvm.org/svn/llvm-project/llvm/trunk'
	"llvm/tools/clang"::'svn+http://llvm.org/svn/llvm-project/cfe/trunk'
	"llvm/tools/clang/tools/extra"::'svn+http://llvm.org/svn/llvm-project/clang-tools-extra/trunk'
	"llvm/projects/compiler-rt"::'svn+http://llvm.org/svn/llvm-project/compiler-rt/trunk'
    "templight"::'git+https://github.com/mikael-s-persson/templight.git'
)

md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

#if [ ${CARCH} == x86_64 ]; then
#    _target=$CARCH
#else
    _target="X86"
#fi

_prefix=/usr/opt/templight

pkgver() {
    cd "$srcdir/templight"
    printf "2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    mkdir -p build
    cd build
    msg "Entered `pwd`"
    _python2bin="$srcdir/python2bin"
    msg "Building Python2 bin '$_python2bin'"
    mkdir -p "$_python2bin"
    cd "$_python2bin"
    ln -fs /usr/bin/python2 python
    ln -fs /usr/bin/python2-config python-config
    export PATH="$_python2bin/:${PATH}"
    cd "$srcdir/build"

    # Include location of libffi headers in CPPFLAGS
    export CPPFLAGS="$CPPFLAGS $(pkg-config --cflags libffi)"

    msg "removing 'sample' project" #it does not do anything useful for us
    rm -rf "$srcdir/$pkgname/projects/sample"
    pwd

    msg "Adding the templight subproject"
    cd "$srcdir/llvm/tools/clang/tools"
    echo "add_subdirectory(templight)" >> CMakeLists.txt
    mv $srcdir/templight $srcdir/llvm/tools/clang/tools/templight

    msg "Applying the clang patch"
    cd ..
    svn patch tools/templight/templight_clang_patch.diff

    cd "$srcdir/build"
    
# several undocumented configure options that were used by someone else to build LLVM/Clang with clang and c++...
# those that fail are commented out again.
#build only enables host target.
    msg "Configuring build"
    cmake -DLLVM_TARGETS_TO_BUILD="$_target" ../llvm/

#fixing packaging problems with libc++ makefile
#essentially the same functions can be performed by toolchain.install
# sed -i 's/chown -R root:wheel $(HEADER_DIR)/#placeholder: chown -R broke packaging/b' $srcdir/llvm/projects/libcxx/Makefile 
}

build(){
    cd "$srcdir/build"
    msg "Building in `pwd` with path '${PATH}'"

	make REQUIRES_RTTI=1 || return 1
}

package() { 
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install || return 1 
}
