# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=bash-completion-waf
pkgver=r3292
pkgrel=2
pkgdesc="Bash completion for WAF (Python based build tool)"
url="http://code.google.com/p/waf/"
arch=('any')
license=('BSD')
depends=('waf' 'bash')
source=("http://waf.googlecode.com/svn-history/r3292/trunk/utils/waf-completion.bash")
md5sums=('fe5890dfccd34082a23c38c3d17aae9f')

package() {
	install -d "${pkgdir}/etc/bash_completion.d"
	install "${srcdir}/waf-completion.bash" "${pkgdir}/etc/bash_completion.d/waf"
	install -d "${pkgdir}/usr/share/licenses/bash-completion-waf"
	ln -s /usr/share/licenses/waf/LICENSE "${pkgdir}/usr/share/licenses/bash-completion-waf/LICENSE"
}

