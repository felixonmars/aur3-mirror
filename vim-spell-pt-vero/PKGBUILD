# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>
# Contributor: Kazuo Teramoto <kaz <dot> rag <at> gmail <dot> com>

pkgname=vim-spell-pt-vero
pkgver=20131030
_pkgver=2013-10-30
pkgrel=1
pkgdesc="VIM spellchecker files for pt using Vero from BrOffice.org."
depends=('vim')
makedepends=('unzip')
arch=('any')
license=('LGPL2.1')
options=('!libtool' '!strip')
conflicts=('vim-spell-pt')
url="http://pt-br.libreoffice.org/projetos/projeto-vero-verificador-ortografico/"
source=(http://pt-br.libreoffice.org/assets/ptBR-${_pkgver}AOC.zip
        http://pt-br.libreoffice.org/assets/ptPT-${_pkgver}AOC.zip)
md5sums=('fe150a61fff1036ed0fc9b95bed65032'
         '43649c40bd8762a782c5af17e607b73f')

package() {
  cd $srcdir

  LC_ALL=C vim -u NONE -c "set encoding=latin1" \
                              -c "mkspell pt pt_BR pt_PT" -c "q"

  LC_ALL=C vim -u NONE -c "set encoding=utf-8" \
                         -c "mkspell pt pt_BR pt_PT" -c "q"

  installpath="$pkgdir/usr/share/vim/vimfiles/spell"
  mkdir -p $installpath
  cp *spl $installpath
}

# vim:set ts=2 sw=2 et:
