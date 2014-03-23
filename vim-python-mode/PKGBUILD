# Maintainer: Otto Sabart <seberm[at]seberm[dot]com>

pkgname=vim-python-mode
pkgver=0.7.8b.r44.gb92c982
pkgrel=1
pkgdesc='vim plugin that helps you to create python code very quickly by utilizing libraries including pylint, rope, pydoc, pyflakes, pep8, and mccabe for features like static analysis, refactoring, folding, completion, documentation, and more'
arch=('any')
license=('LGPL3')
url='https://github.com/klen/python-mode'
install='vim-python-mode.install'
depends=('vim' 'python2')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname"::'git://github.com/klen/python-mode.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/$pkgname"
  rm -rf \.git \.gitignore README.rst

  install -d ${pkgdir}/usr/share/vim/vimfiles/
  cp -r ./ ${pkgdir}/usr/share/vim/vimfiles/
}
