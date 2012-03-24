# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=vim-spell-pt-br
pkgver=20110527
pkgrel=1
pkgdesc="VIM spellchecker files for pt_BR using Vero from BrOffice.org."
depends=('vim')
makedepends=('unzip')
arch=('any')
license=('LGPL2.1')
options=('!libtool' '!strip')
conflicts=('vim-spell-pt')
url="http://www.broffice.org/verortografico/baixar"
source=(http://www.broffice.org/files/pt_BR-2011-05-27AOC.zip)
md5sums=('606bf3aca8ae8b4f7dfece9164bcf725')

build() {
  cd $srcdir

  LC_ALL=pt_BR.ISO-8859-1 vim -u NONE -c "set encoding=latin1" \
                              -c "mkspell br pt_BR" -c "q"

  LC_ALL=pt_BR.UTF-8 vim -u NONE -c "set encoding=utf-8" \
                         -c "mkspell br pt_BR" -c "q"

  installpath="$pkgdir/usr/share/vim/vimfiles/spell"
  mkdir -p $installpath
  cp *spl $installpath
}

# vim:set ts=2 sw=2 et:
