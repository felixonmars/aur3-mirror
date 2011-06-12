# Maintainer: Army <uli armbruster who uses the google mail service>

pkgname=vimchat
pkgver=0.142
pkgrel=2
pkgdesc="Instant messaging plugin for VIM"
arch=('any')
url="http://vimchat.googlecode.com"
source=(${url}/files/${pkgname}-${pkgver}.tar.gz bin)
license=(GPL)
depends=('vim' 'xmpppy')
install=$pkgname.install

package() {
	install -Dm644 "${pkgname}/plugin/vimchat.vim" "${pkgdir}//usr/share/vim/vimfiles/plugin/vimchat.vim"
	install -Dm644 "${pkgname}/syntax/vimchat.vim" "${pkgdir}//usr/share/vim/vimfiles/syntax/vimchat.vim"
	install -Dm644 "${pkgname}/config" "${pkgdir}/usr/share/doc/${pkgname}/config"
	install -Dm755 "bin" "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('4eefe54d6bac3ef01b3ecefbfb069849'
         '80ee4bf51489522701ffd127fdeecdbf')
