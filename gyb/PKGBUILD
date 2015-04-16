# Maintainer: Ista Zahn <istazahn@gmail.com>
# Source: https://github.com/jay0lee/got-your-back
pkgname=gyb
pkgver=0.30
pkgrel=1
pkgdesc="CLI tool to back up and restore gmail"
arch=(any)
url="https://github.com/jay0lee/got-your-back/wiki"
license=(Apache)
depends=('python2')
conflicts=(${pkgname}-git gotyourback got-your-back)
source=("https://github.com/jay0lee/got-your-back/archive/v${pkgver}.tar.gz")
install=gyb.install

md5sums=('ae3e8fb5548ff8ed5440eebbe60288d5')

package() {
  cp -R $srcdir "${pkgdir}/opt/"
  cd "${pkgdir}/opt/"
  mv "got-your-back-${pkgver}" gyb
  chmod 777 gyb
}

# vim:set ts=2 sw=2 et:
