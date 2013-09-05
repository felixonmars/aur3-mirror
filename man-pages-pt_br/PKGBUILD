# Maintainer: LaraCraft304 <lara@craft.net.br>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=man-pages-pt_br
pkgver=2004.7.26
pkgrel=1
epoch=1
pkgdesc="Brazilian Portuguese collection of manpages"
arch=('any')
license=('GPL')
url="http://ldp-br.conectiva.com.br/projetos/man/man.html"
depends=('man-pages')
source=('http://ldp-br.conectiva.com.br/projetos/man/arquivos/man-todas.tgz')
md5sums=('b91e343fe37d075379b4a64cefedc60e')

prepare() {
	cd "$srcdir"/arquivos
	
	# Remove CVS folders
	rm -rf man*/CVS
	
	# Remove passwd translation (already in 'shadow' package)
	rm -f man5/passwd.5
}

package() {
	cd "$srcdir"/arquivos
	install -d "$pkgdir"/usr/share/man/pt_BR
	cp -r man* "$pkgdir"/usr/share/man/pt_BR/
}
