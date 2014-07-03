# Contributor: Erico Nunes <nunesDOTericoATgmailDOTcom>
# Maintainer: Erico Nunes <nunesDOTericoATgmailDOTcom>

pkgname=vim-glsl
pkgver=1.10.00
pkgrel=3
pkgdesc="GLSL (OpenGL Shading Language) syntax highlighting for Vim."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1002"
license=(GPL)
source=('glsl.vim')
depends=()
md5sums=('5b0fd5f19948ee3d833a6cf696e46699')

package() {
	cd ${srcdir}

	local _vimfiles="$pkgdir/usr/share/vim/vimfiles"
	local _syntax="$_vimfiles/syntax"
	local _ftdetect="$_vimfiles/ftdetect"
	mkdir -p ${_syntax} ${_ftdetect}

	echo "au BufNewFile,BufRead *.glsl,*.vert,*.geom,*.frag,*.vs,*.gs,*.fs set filetype=glsl" > "$_ftdetect/glsl.vim"

	install -m 644 glsl.vim ${_syntax}
}

