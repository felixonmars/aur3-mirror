# Maintainer: Andre <andre-arch@delorus.de> 
pkgname=git-latexdiff-git
_gitname=git-latexdiff
pkgver=r60.49bbd42
pkgrel=1
pkgdesc="git-latexdiff is a wrapper around latexdiff (http://www.ctan.org/pkg/latexdiff) that allows using it to diff two revisions of a LaTeX file."
arch=('i686' 'x86_64')
source=('git+https://gitorious.org/git-latexdiff/git-latexdiff.git')
url="https://gitorious.org/git-latexdiff/git-latexdiff"
license=('custom:${_gitname}')
depends=('texlive-core' 'git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  sed -n '/# Copying and distribution/,/ any warranty./p' git-latexdiff > LICENSE

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
  install -Dm755 git-latexdiff "$pkgdir/usr/lib/git-core/git-latexdiff"
}

