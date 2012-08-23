# Contributor: Voldemar Khramtsov <harestomper@gmail.com>

pkgname=itmages-screenshot-bzr
origname="itmages-screenshot"
pkgver=9
pkgrel=1
pkgdesc="Allow create screenshot and upload to ITmages.ru"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~itmages/itmages/itmages-screenshot"
license=('GPL')
groups=('graphics')
depends=('itmages-service' "gtk2" "glib2")
makedepends=("cmake" "make" "vala>=0.12"  "pkg-config")
_install="${origname}.install"
_cmake_patch="disable_threads_init.patch"
#_bzrtrunk="lp:~itmages/itmages/${origname}"
_bzrtrunk="https://code.launchpad.net/~itmages/itmages/itmages-screenshot"
_bzrmod=${origname}
source=(
        ${_install}
        ${_cmake_patch})

md5sums=('8c0164476fc5f4ea7a54450cf0e590ae'
         'c502625475800f4bc229c4ada5239847')


build() {
    cd "$srcdir"
    msg "Connecting to Bazaar server...."

    if [ -d ${_bzrmod} ] ; then
        cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
        msg "The local files are updated."
    else
        bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
    fi

    msg "Bazaar checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_bzrmod-build"
    cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
    cd "$srcdir/$_bzrmod-build"

    #
    # BUILD HERE
    #
    
    msg "Patching with ${_cmake_patch}"
    patch -Np1 -i ${srcdir}/${_cmake_patch} || return 1
    cmake CMakeLists.txt || return 1
    make || return 1
}

package() {
    cd "$srcdir/$_bzrmod-build"
    make DESTDIR="$pkgdir/" install
} 

# vim:set ts=2 sw=2 et:
