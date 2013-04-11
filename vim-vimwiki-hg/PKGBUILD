# Contributor: Johannes Dewender < arch at JonnyJD dot net >
pkgname=vim-vimwiki-hg
pkgver=752.e703f256ac9c
pkgrel=1
pkgdesc="Personal Wiki for Vim"
arch=('any')
url="http://code.google.com/p/vimwiki/"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('mercurial')
conflicts=('vim-vimwiki')
provides=('vim-vimwiki')
install=vimdoc.install
source=('hg+https://code.google.com/p/vimwiki' license.txt)
md5sums=('SKIP' 'e19fa0689d06a724fc8ddfe824ef2680')

pkgver() {
  cd "$srcdir/vimwiki"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package() {
  cd "$srcdir/vimwiki"
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki
  install -m644 ${srcdir}/vimwiki/src/autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/
  install -d ${pkgdir}/usr/share/vim/vimfiles/{ftplugin,plugin,syntax}
  for x in {ftplugin,plugin,syntax}; do
    install -m644 ${srcdir}/vimwiki/src/$x/* \
      ${pkgdir}/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -d ${pkgdir}/usr/share/vim/vimfiles/doc
  install -m644 ${srcdir}/vimwiki/src/doc/vimwiki.txt \
    ${pkgdir}/usr/share/vim/vimfiles/doc/
}

# vim:set ts=2 sw=2 et:
