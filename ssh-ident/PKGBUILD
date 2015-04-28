# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brendan MacDonell <macdonellba@gmail.com>
pkgname=ssh-ident
pkgver=20150426
pkgrel=4
pkgdesc="Start ssh-agent and load identities on-demand."
arch=('any')
url="https://github.com/ccontavalli/ssh-ident"
license=('BSD')
depends=(openssh python)
install=ssh-ident.install
source=('https://github.com/ccontavalli/ssh-ident/archive/9682500d7d729abd35156ffac7932976b72d35d5.zip'
        'ssh-ident.install')
sha1sums=('f722ac5f0f5026b274987f49e6ecb70f16d4c415'
          '6ce215ed4f976e565d1ceb5d2c302c726e0716d0')

package() {
  cd ${pkgname}-*
  install -D ssh-ident "${pkgdir}/usr/bin/ssh-ident"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
