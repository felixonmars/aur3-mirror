# Maintainer: Techlive Zheng <techlivezheng@gmail.com>

pkgname=git-hg-again-git
_pkgname='git-hg-again'
pkgver=r3.5bfef28
pkgrel=2
pkgdesc="A bi-directional Git to Mercurial interface (like git-svn)"
arch=(any)
url="https://github.com/abourget/git-hg-again"
license=('MIT')
depends=('git'  'hg-git')
makedepends=()
provides=('git-hg-again')
conflicts=('git-hg' 'git-hg-git' 'git-hg-again')
source=('git+https://github.com/abourget/git-hg-again.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 "${_pkgname}"/githg.py "${pkgdir}"/usr/lib/git-core/git-hg

    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/lib/git-core/git-hg "${pkgdir}"/usr/bin/git-hg
}
