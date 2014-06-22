# Contributor: m0rph <m0rph.mailbox@gmail.com>

_pkgname=git-flow-completion
pkgname=fish-completion-gitflow-avh
pkgver=0.5.1
pkgrel=1
pkgdesc='Fish completion support for gitflow (AVH-Edition).'
arch=('any')
url='https://github.com/petervanderdoes/git-flow-completion'
license=('MIT')
depends=('git' 'gitflow' 'fish')
source=("https://github.com/petervanderdoes/git-flow-completion/archive/${pkgver}.tar.gz")
md5sums=('e4cc40aaf00a0e99e4e4b927c0dd49ee')

package() {
   cd "$srcdir/$_pkgname-$pkgver"
   install -d $pkgdir/usr/share/fish/completions/
   install -m 0644 git.fish $pkgdir/usr/share/fish/completions/git-flow.fish
}
