# Contributor: Mathieu Gaborit <mathieu@matael.org> 

pkgname=vim-arduino-snippets
pkgver=1.0
pkgrel=3
pkgdesc="Some snippets to simplify code for arduino boards"
arch=('any')
url="http://code.google.com/p/vim-arduino-snippets/"
license=('GPL3')
depends=('vim-snipmate' 'vim')
source=('http://vim-arduino-snippets.googlecode.com/files/vim-arduino-snippets-1.0.tar.gz')
md5sums=('c082e3b471536ce21a170b5588335dd5')

install() {
	install -Dm755 ${srcdir}/${pkgname} /usr/share/vim/vimfiles/snippets/arduino.snippets
  echo "Make sure to append filetpye detection for *.pde in
your .vimrc :
filetype plugin on
au BufNewFile,BufRead *.pde setf arduino"
}

