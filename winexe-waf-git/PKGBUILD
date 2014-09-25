# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=winexe-waf-git
pkgver=r234.b787d2a
pkgrel=1
pkgdesc="Remote Windows command executor"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/winexe/"
license=('GPL')
depends=("smbclient")
makedepends=("python2" "mingw-w64-gcc" "samba" "git")
provides=("winexe")
conflicts=("winexe")
source=("${pkgname}::git://git.code.sf.net/p/winexe/winexe-waf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/source"

    local forcedpath=/dev/shm/forcedpath

    mkdir -p ${forcedpath}
    ln -sf /usr/bin/python2 ${forcedpath}/python
    export PATH=${forcedpath}:$PATH
    export LDFLAGS=""
    export CFLAGS=""

    msg "Using Python from $(which python)"
    ./waf configure build
}

package() {
    cd "${srcdir}/${pkgname}/source"
    install -Dm755 build/winexe ${pkgdir}/usr/bin/winexe
}
