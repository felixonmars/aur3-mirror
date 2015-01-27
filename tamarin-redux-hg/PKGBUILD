# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

_pkgname=tamarin-redux
pkgname=${_pkgname}-hg
pkgver=r7587.5571cf86fc68
pkgrel=7
pkgdesc="A high-performance, open source implementation of the ECMAScript 4th edition (ES4) language specification"
arch=('i686' 'x86_64')
license=('custom:MPL2')
url='http://www-archive.mozilla.org/projects/tamarin/'
depends=('gcc-libs')
makedepends=('python2' 'mercurial')
source=("${_pkgname}"::"hg+http://hg.mozilla.org/tamarin-redux")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    # create a fake bin for python2
    local _fake_bin
    _fake_bin="${srcdir}/fake-bin"
    mkdir -p "${_fake_bin}"
    cd "${_fake_bin}"
    [ -f python ] || ln -s /usr/bin/python2 python
    export PATH=${srcdir}/fake-bin:$PATH

    # remove -Werror
    cd "${srcdir}/${_pkgname}"
    sed -i 's/-Werror //g' configure.py
}

build() {
    mkdir -p "${srcdir}/${_pkgname}-build"
    cd "${srcdir}/${_pkgname}-build"
    ../${_pkgname}/configure.py
    make OPT_CXXFLAGS=" -O0 "
}

package() {
    cd "${srcdir}/${_pkgname}-build"
    install -Dm755 shell/avmshell "${pkgdir}/usr/bin/avmshell"
    cd "${srcdir}/${_pkgname}"
    install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
