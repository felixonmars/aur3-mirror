# Maintainer: Techlive Zheng <techlivezheng@gmail.com>

pkgname=git-hg-git
_pkgname='git-hg'
pkgver=r133.9c13962
pkgrel=1
pkgdesc="A git-hg utility for checking out and tracking a mercurial repo"
arch=(any)
url="https://github.com/cosmin/git-hg"
license=('MIT')
depends=('git' 'mercurial' 'hg-fast-export')
makedepends=()
source=('git+https://github.com/cosmin/git-hg.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 "${srcdir}"/"${_pkgname}"/bin/git-hg "${pkgdir}"/usr/lib/git-core/git-hg

    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/lib/git-core/git-hg "${pkgdir}"/usr/bin/git-hg

}
