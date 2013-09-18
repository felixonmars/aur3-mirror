# Contributor: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=vim-vimwiki-git
pkgver=v2.1.0.g5faf884
pkgrel=2
pkgdesc="Personal Wiki for Vim"
arch=('any')
url="http://code.google.com/p/vimwiki/"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
conflicts=('vim-vimwiki')
provides=('vim-vimwiki')
install=vimdoc.install
source=('git+https://github.com/vimwiki/vimwiki.git' license.txt)
md5sums=('SKIP' 'e19fa0689d06a724fc8ddfe824ef2680')

pkgver() {
	cd "$srcdir/vimwiki"
	local ver="$(git describe --long --tags)"
	printf "%s" "${ver//-/.}"
}

package() {
  cd "$srcdir/vimwiki"
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki
  install -m644 ${srcdir}/vimwiki/autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/
  install -d ${pkgdir}/usr/share/vim/vimfiles/{ftplugin,plugin,syntax}
  for x in {ftplugin,plugin,syntax}; do
    install -m644 ${srcdir}/vimwiki/$x/* \
      ${pkgdir}/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -d ${pkgdir}/usr/share/vim/vimfiles/doc
  install -m644 ${srcdir}/vimwiki/doc/vimwiki.txt \
    ${pkgdir}/usr/share/vim/vimfiles/doc/
}

# vim:set ts=2 sw=2 et:
