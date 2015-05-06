# Maintainer: Ignat Loskutov <ignat.loskutov@gmail.com>
pkgname=neovim-neomake-git
pkgver=r250.b6ec875
pkgrel=1
pkgdesc="A plugin for asynchronous :make using Neovim’s job-control functionality"
arch=(any)
url="https://github.com/benekastah/neomake"
license=('MIT')
source=("git+https://github.com/benekastah/neomake.git")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/neomake
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/neomake"
  _installpath="${pkgdir}/usr/share/nvim/runtime/"
  mkdir -p ${_installpath}/{plugin,doc,autoload}
  cp -R autoload ${_installpath}
  cp -R doc ${_installpath}
  cp -R plugin ${_installpath}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
