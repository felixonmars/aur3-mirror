# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: Florian Walch <florian dot walch at gmx dot at>

pkgname=pipe
pkgver=4.3.0
pkgrel=1
pkgdesc="Platform Independent Petri Net Editor."
arch=('any')
url="http://sourceforge.net/projects/pipe2/"
license=('OSL3.0')
depends=('java-runtime>=1.6')
source=("http://sourceforge.net/projects/pipe2/files/PIPEv4/PIPEv${pkgver}/PIPEv${pkgver}.zip"
  pipe
  LICENSE)
md5sums=('8d4d9acc0c4fe706386c9fd6cb8a8bd4'
         '7b12f2aedc23ad66aeb7f3543dc00bd0'
         '7cf9b4e08660478ca4246e4333cecedd')

package() {
  # install files and executable
  install -d "${pkgdir}/usr/share/java/pipe"
  cp -dr "${srcdir}/PIPEv${pkgver}/Pipe"/* "${pkgdir}/usr/share/java/pipe"
  install -Dm755 "${srcdir}/pipe" "${pkgdir}/usr/bin/pipe"

  # install license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
