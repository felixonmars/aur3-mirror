# Maintainer: Chih-Mao Chen <pkmx.tw@gmail.com>

pkgname=dropboxannex-git
pkgver=r14.905f6a3
pkgrel=1
pkgdesc="Dropbox special remote for git-annex"
arch=('any')
url="https://github.com/TobiasTheViking/dropboxannex"
license=('unknown')
depends=('git-annex' 'python2-setuptools') # python2-setuptools for pkg_resources
makedepends=('git')
conflicts=('dropboxannex')
provides=('dropboxannex')
source=("$pkgname"::'git://github.com/TobiasTheViking/dropboxannex')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  true
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 git-annex-remote-dropbox "$pkgdir/usr/share/$pkgname/git-annex-remote-dropbox"
  install -Dm644 app.py "$pkgdir/usr/share/$pkgname/app.py"
  cp -r lib "$pkgdir/usr/share/$pkgname/lib"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/git-annex-remote-dropbox" "$pkgdir/usr/bin/git-annex-remote-dropbox"
}
