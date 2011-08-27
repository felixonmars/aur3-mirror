# Maintainer: Piotr Banaszkiewicz <piotr at banaszkiewicz dot organization>

pkgname=vim-indentguides-git
pkgver=20110225
pkgrel=1
pkgdesc="Indent Guides is a plugin for visually displaying indent levels in Vim."
arch=('any')
url="https://github.com/nathanaelkane/vim-indent-guides"
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-indentguides')
conflicts=('vim-indentguides')
 
_gitroot=git://github.com/nathanaelkane/vim-indent-guides.git
_gitname=vim-indent-guides
#_gitroot=git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex
#_gitname=vim-latex
 
build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	
    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    install -d ${pkgdir}/usr/share/vim/vimfiles
    cp -R --preserve=mode autoload doc plugin $pkgdir/usr/share/vim/vimfiles
}
