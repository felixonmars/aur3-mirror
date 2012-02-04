pkgname=zsh-packer
pkgver=2
pkgrel=2
pkgdesc="ZSH functions to tab-complete repo package names for packer"
url="https://github.com/bruenig/packer"
depends=(zsh)
source=(_packer)
arch=('any')
license=('GPL')
md5sums=('208cc340ef85e351ca37d397b604e2a4')

build() {
  mkdir -p $startdir/pkg/usr/share/zsh/site-functions/
  install -m644 _packer $startdir/pkg/usr/share/zsh/site-functions/_packer
}

