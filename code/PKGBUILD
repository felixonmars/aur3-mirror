pkgname=code
pkgver=0.1.0
pkgrel=1
pkgdesc="Code focused development. Redefined."
arch=('x86_64')
url="https://code.visualstudio.com/"
depends=()
makedepends=()
optdepends=()
source=("http://download.microsoft.com/download/0/D/5/0D57186C-834B-463A-AECB-BC55A8E466AE/VSCode-linux-x64.zip"
        "LICENSE")
md5sums=('50d4547e3617ace370f040edace6d7cd'
         'bf0593b6486c5587e142634692ea18fe')

package() {
  # LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p ${pkgdir}/opt/microsoft/code/
  mv * ${pkgdir}/opt/microsoft/code/

  mkdir -p ${pkgdir}/usr/bin/
  ln -s ${pkgdir}/opt/microsoft/code/Code ${pkgdir}/usr/bin/Code
}

# vim:set ts=2 sw=2 et:
