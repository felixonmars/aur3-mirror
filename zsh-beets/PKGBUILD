# Maintainer: shmibs <shmibs@gmail.com>
pkgname=zsh-beets
pkgver=1
pkgrel=1
pkgdesc="zsh completions for beets"
arch=('any')
url="https://github.com/sampsyo/beets/blob/master/extra/_beet"
license=('MIT')
depends=('beets' 'zsh')
source=('https://raw.githubusercontent.com/sampsyo/beets/master/extra/_beet'
        'https://raw.githubusercontent.com/sampsyo/beets/master/LICENSE')
md5sums=('4a9bbf2566d12ae5f697a3efaf9f028c' '1178abc88a6ba9935b2d090aa83f685e')

package() {
	cd "${srcdir}"
  install -D -m644 _beet "${pkgdir}/usr/share/zsh/site-functions/_beet"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
