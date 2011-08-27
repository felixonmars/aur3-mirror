#Maintainer: Jonathan Fine <were.Vire@gmail.com>
#Collector: Juliet A. Singleton <www.northcastle.co.uk>
#Font Source: dafont.com
#Font Source: Forsaken Legend <forsakenlegend.net>
#Font Source: MDTA <mdta@mdtauk.screeming.net>
#Font Source: Hotaru S. Tomoe <hyrulerealm.gaurdianarchives.com>
#Font Source: Kasuto <kasuto.net>

pkgname=ttf-hylian-fonts
pkgver=1.0
pkgrel=2
pkgdesc="A set of hylian fonts for all zelda fans!."
arch=('any')
url="http://www.northcastle.co.uk/archive/desktop/desktop.html"
license=('unknown')
depends=('fontconfig')
install=$pkgname.install
_nca="http://www.northcastle.co.uk/archive/desktop"
source=(${_nca}/font_triforce.zip ${_nca}/font_tphylian.zip ${_nca}/font_hylian_symbols.zip 
	${_nca}/font_ht_hylian.zip ${_nca}/font_ancienthylian.zip ${_nca}/font_hylian_rounded.zip )
md5sums=('9a86be4286229a8dcff631451af7d2fa'
         'b80012d5f2fe73796dd6474fb2c1bc5b'
         '1b38827c096bcd30274c6c692e3378ea'
         '1104407b5229e82306587e37c5afba1c'
         '4ba8f152ed5a811c5395135e273cd60b'
         'ad32abcae7e7d31358bc521be656d240')
package() {
  cd "$srcdir"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  cp *.ttf "${pkgdir}/usr/share/fonts/TTF"
  cp *.otf "${pkgdir}/usr/share/fonts/TTF"
}
