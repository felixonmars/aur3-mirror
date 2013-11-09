pkgname=coreutils-git
_pkgname=coreutils
pkgver=v8.21.62.g5a7f03c
pkgrel=1
pkgdesc="basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('base')
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap')
makedepends=('git')
install=${_pkgname}.install
source=(git://git.sv.gnu.org/coreutils)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./bootstrap

    git submodule foreach git pull origin master

    ./configure --prefix=/usr --libexecdir=/usr/lib \
        --enable-no-install-program=groups,hostname,kill,uptime
    make
}

check() {
    cd "${srcdir}/${_pkgname}"
    make RUN_EXPENSIVE_TESTS=yes check || true
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
