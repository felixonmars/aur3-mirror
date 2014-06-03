# Maintainer: David Neumann <davidjneumann@gmail.com> 

pkgname=peg-multimarkdown-latex-support-git
pkgver=r34.39e96e5
pkgrel=1
pkgdesc="Default support files for generating LaTeX documents with MMD 3.0 and 4.0"
arch=('i686' 'x86_64')
install=peg-multimarkdown-latex-support-git.install
url="https://github.com/fletcher/peg-multimarkdown-latex-support"
license=('BSD')
makedepends=('git')
source=("$pkgname"::'git://github.com/fletcher/peg-multimarkdown-latex-support.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # Delete the documentation files
  find $srcdir/$pkgname \( -iname "Organ*" -o -iname "README.md" -o -path "*.git" \) -print0 \
      | while read -d '' -r del; do
    rm -rf "$del"
  done

  # Install all the assets and templates
  install -dm755 "$pkgdir/etc/texmf/tex/latex/mmd"
  cp -r --no-target-directory $srcdir/$pkgname/ "$pkgdir/etc/texmf/tex/latex/mmd"
}
