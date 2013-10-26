#Maintainer: Techlive Zheng <techlivezheng at gmail dot com>

_pkgname=git-flow-completion
pkgname=bash-completion-gitflow
pkgver=0.4.2.2
pkgrel=1
pkgdesc='Bash completion support for gitflow.'
arch=('any')
url='https://github.com/bobthecow/git-flow-completion'
license=('MIT')
depends=('bash-completion' 'gitflow')
source=("https://github.com/bobthecow/git-flow-completion/tarball/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a5d4760b289d729aa7ff2585d455b847')

package() {
  cd $srcdir/`find . -maxdepth 1 -type d -name bobthecow\*`
  install -d $pkgdir/etc/bash_completion.d
  install -m 0755 git-flow-completion.bash $pkgdir/etc/bash_completion.d/
}
