# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>

pkgname=vim-paster
pkgver=1.2
pkgrel=2
pkgdesc="VIM plugin to paste to any pastebin service"
arch=('i686' 'x86_64')
url="http://eugeneciurana.com/site.php?page=tools#paster"
license=('BSD')
depends=('vim' 'curl')
makedepends=('unzip')
groups=('vim-plugins')
source=(http://eugeneciurana.com/tools/downloads/paster.zip 'LICENSE')
md5sums=('8012428c7c0c6228b19c51b84915baaa'\
        '31231fc00846c9dca55d004a43b027f7') 

build() {
  cd $srcdir/
  install -d ${pkgdir}/usr/share/{licenses/${pkgname},doc/${pkgname},vim/vimfiles/plugin,vim/vimfiles/doc}
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 doc/paster.txt ${pkgdir}/usr/share/vim/vimfiles/doc/
  install -Dm644 plugin/{paster-config.vim,paster.vim} ${pkgdir}/usr/share/vim/vimfiles/plugin/
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
