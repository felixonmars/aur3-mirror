_pkgname=vim-vagrant
pkgname=vim-vagrant-git
pkgver=1400003630
pkgrel=1
pkgdesc="basic vim/vagrant integration"
arch=('any')
url='https://github.com/markcornick/vim-vagrant'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-vagrant')
conflicts=('vim-vagrant')

source=('git://github.com/markcornick/vim-vagrant.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

