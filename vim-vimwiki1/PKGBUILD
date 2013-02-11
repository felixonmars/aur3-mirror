# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki1
pkgver=1.2
pkgrel=1
pkgdesc="Personal Wiki for Vim"
arch=('any')
url="http://code.google.com/p/vimwiki/"
license=('MIT')
groups=('vim-plugins')
depends=(vim)
provides=('vim-vimwiki=1.2')
conflicts=('vim-vimwiki')
install=vimdoc.install
source=(http://vimwiki.googlecode.com/files/vimwiki-1-2.zip
        license.txt)
md5sums=('fc99c8f589db191dc4bfe9aff4243788'
         'e19fa0689d06a724fc8ddfe824ef2680')

package () {
  install -d ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki \
    || return 1
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,ftplugin} \
    || return 1
  install -d ${pkgdir}/usr/share/vim/vimfiles/{plugin,syntax}/ \
    || return 1
  install -Dm644 ${srcdir}/autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/ \
    || return 1;
  for x in {ftplugin,plugin,syntax}; do
    install -Dm644 ${srcdir}/$x/* \
      ${pkgdir}/usr/share/vim/vimfiles/$x/ \
      || return 1;
  done
  install -Dm644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license.txt \
    || return 1
  install -Dm644 ${srcdir}/doc/vimwiki.txt \
    ${pkgdir}/usr/share/vim/vimfiles/doc/ \
    || return 1;
}

# vim:set ts=2 sw=2 et:
