# Maintainer: Nicolas Hafner <shinmera@tymoon.eu>
pkgname="clasp-git"
pkgver=0.2
pkgrel=1
_srcname="clasp"
pkgdesc="Common Lisp implementation interoperating with C++ through LLVM/Clang"
arch=("x86_64")
url="https://github.com/drmeister/clasp"
license=("LGPL2.1")
options=("!strip" "!makeflags" "!buildflags" "!distcc" "!ccache")
provides=("clasp")
conflicts=("clasp")
depends=("boost-libs>=1.55" "llvm-libs>=3.6")
makedepends=("python2" "externals-clasp")
source=("${_srcname}::git+https://github.com/drmeister/clasp.git")
## In case you have a local copy and don't want to wait for the clone every time:
#source=("${_srcname}::git+file:///opt/clasp/package/clasp/origin/")
sha256sums=("SKIP")
_minmem_mps=16
_minmem_boehm=4
_make_mps=${BUILD_MPS:-true}
_make_boehm=${BUILD_BOEHM:-true}

_notify() {
    echo -e "$(tput setaf 1)$(tput bold)  -> ${1}: $(tput sgr0)$2"
    return 0
}

_test_memory() {
    local ramkb=$(free|awk '/^Mem:/{print $2}')
    local swpkb=$(free|awk '/^Swap:/{print $2}')
    local memkb=$((${ramkb}+${swpkb}))
    local memgb=$((${memkb}/(1024*1024)))
    
    if [ $memgb -lt $_minmem_boehm ] && [ $make_boehm = true ]; then
        _notify "Error" "You only have ${memgb} GB of RAM and SWAP available, but Clasp needs at least ${_minmem_boehm} GB to compile boehm. \n
Please create a swap file to extend your available memory. See https://wiki.archlinux.org/index.php/Swap#Swap_file"
        exit
    elif [ $memgb -lt $_minmem_mps ] && [ $make_mps = true ]; then
        _notify "Warning" "You only have ${memgb} GB of RAM and SWAP available, but Clasp needs up to ${_minmem_mps} GB to compile fully. \n
Only building the boehm version for now. If you need MPS, create a swap file to extend your available memory. See https://wiki.archlinux.org/index.php/Swap#Swap_file"
        _make_mps=false
    fi
}

pkgver() {
    cd "${srcdir}/${_srcname}"
    echo $(git rev-parse --short HEAD)
}

prepare() {
    local CPUS=$(grep -c '^processor' /proc/cpuinfo)
    cd "${srcdir}/${_srcname}"
    cat >local.config <<EOF
export TARGET_OS = linux
#export EXTERNALS_SOURCE_DIR = /opt/clasp/package/externals-clasp/test
export EXTERNALS_SOURCE_DIR = /opt/clasp/externals
export PJOBS = $CPUS
export PYTHON2 = /usr/bin/python2
export LINK = static
export ADDRESS-MODEL = 64
EOF
}

_make (){
    env -i HOME="$HOME" LC_CTYPE="${LC_ALL:-${LC_CTYPE:-$LANG}}" PATH="$PATH" USER="$USER" make $1
}

_build_boehm() {
    cd "${srcdir}/${_srcname}"
    _make submodules-boehm \
        && _make asdf \
        && _make boostbuildv2-build \
        && _make clasp-boehm
}

_build_mps() {
    cd "${srcdir}/${_srcname}"
    _make submodules-mps \
        && _make clasp-mps
}

build() {    
    _test_memory
    
    if [ $_make_mps = true ] && [ $_make_boehm = true ]; then
        _notify "Note" "Building clasp fully will take up to six hours on a modern, fast system. Be /very/ patient."
    elif [ $_make_boehm = true ]; then
        _notify "Note" "Building clasp with boehm will take up to three hours on a modern, fast system. Be /very/ patient."
    fi
    
    if [ $_make_boehm = true ]; then
        _build_boehm || (_notify "Note" "Expected failure, retrying." && _build_boehm)
    fi
    if [ $_make_mps = true ]; then
        _build_mps
    fi
}

package() {
    mkdir -p "${pkgdir}/opt/clasp/bin" "${pkgdir}/usr/bin"
    cp -a "${srcdir}/${_srcname}/build/clasp/." "${pkgdir}/opt/clasp/"

    if [ -f "${pkgdir}/opt/clasp/bin/clasp_mps_o" ]; then
        ln -s "/opt/clasp/bin/clasp_mps_o" "${pkgdir}/usr/bin/clasp"
    else
        ln -s "/opt/clasp/bin/clasp_boehm_o" "${pkgdir}/usr/bin/clasp"
    fi
}
