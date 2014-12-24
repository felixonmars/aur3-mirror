# Maintainer: Nathan Typanski <mail@nathantypanski.com>

_pkgname=global-pygments-plugin
pkgname=global-pygments-plugin-git
pkgver=0.1.1.r3.gaebed6d
pkgrel=1
pkgdesc="Pygments Plug-in Parser for GNU GLOBAL"
arch=('i686' 'x86_64')
url="https://github.com/yoshizow/global-pygments-plugin"
license=('GPL')
depends=('global' 'python2-pygments' 'python2-mock')
makedepends=('git')
optdepends=('idutils' 'ctags')
options=(!emptydirs libtool)
install=global-pygments-plugin.install
source=(git://github.com/yoshizow/$_pkgname.git sample.globalrc)

pkgver() {
        cd "$_pkgname"
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${_pkgname}"
        export PYTHON="/usr/bin/python2"
        sh reconf.sh --prefix=/usr --with-exuberant-ctags=/usr/bin/ctags
        ./configure
        make
}

check() {
        cd "${srcdir}/${_pkgname}"
        make -k check
}

package() {
        cd "${srcdir}/${_pkgname}"
        make DESTDIR="${pkgdir}" install
        install -Dm644 "${srcdir}"/sample.globalrc \
            "${pkgdir}"/usr/share/gtags/sample.globalrc
}

md5sums=('SKIP'
         '7a44e91898f7bd4c8e3b1e1675b726ff'
)
sha256sums=('SKIP'
            '4518fa6bfd35081f9b17791bbe4e833e0b1144f0502e0f30c50c0e0dc9f851ac'
)
