# Author: Thomas Weißschuh <thomas t-8ch de>

pkgname='git-subtree-link'
pkgver=1
pkgrel=1
pkgdesc='Link git-subtree from contrib directory'
url='https://aur.archlinux.org/packages/git-subtree-link/'
license=('WTFPL')
depends=('git')
provides=('git-subtree')
conflicts=('git-subtree')
arch=('any')

package() {
	_git_libdir="${pkgdir}/usr/lib/git-core/"
	install -d "$_git_libdir"
	ln -s /usr/share/git/subtree/git-subtree.sh "$_git_libdir"/git-subtree
}
