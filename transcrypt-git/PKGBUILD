# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=transcrypt-git
_gitname=transcrypt
pkgver=latest
pkgrel=1
pkgdesc='Transparently encrypt files within a git repository.'
arch=('any')
url="https://github.com/elasticdog/transcrypt"
license=('MIT')
depends=('git' 'bash' 'openssl')
provides=('transcrypt')
source=("git+https://github.com/elasticdog/transcrypt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/${_gitname}"

  install -Dm 644 contrib/bash/transcrypt \
    "$pkgdir/usr/share/bash-completion/completions/transcrypt"
  # TODO: zsh completion
  install -Dm 644 man/transcrypt.1 "$pkgdir/usr/share/man/man1/transcrypt.1"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 755 transcrypt  "${pkgdir}/usr/bin/transcrypt"
}
 
