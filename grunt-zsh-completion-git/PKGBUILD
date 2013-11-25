pkgname=grunt-zsh-completion-git
pkgdesc="zsh completion for grunt"
url="http://github.com/yonchu/grunt-zsh-completion"
pkgver=20131124
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
provides=("grunt-zsh-completion")
conflicts=("grunt-zsh-completion")
source=("git+http://github.com/yonchu/grunt-zsh-completion.git")
sha1sums=('SKIP')

package() {
  install -D $srcdir/grunt-zsh-completion/_grunt $pkgdir/usr/share/zsh/site-functions/_grunt
}
