# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=git-flow-completion
pkgname=bash-completion-gitflow-avh
pkgver=0.5.1
pkgrel=1
pkgdesc='Bash completion support for gitflow (AVH-Edition).'
arch=('any')
url='https://github.com/petervanderdoes/git-flow-completion'
license=('MIT')
depends=('git' 'gitflow' 'bash-completion')
source=("https://github.com/petervanderdoes/git-flow-completion/archive/${pkgver}.tar.gz")
md5sums=('e4cc40aaf00a0e99e4e4b927c0dd49ee')

package() {
   cd "$srcdir/$_pkgname-$pkgver" 
   install -d $pkgdir/etc/bash_completion.d
   install -m 0755 git-flow-completion.bash $pkgdir/etc/bash_completion.d/
}
