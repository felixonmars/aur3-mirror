# Maintainer: Chris Chapman <chris.chapman@aggiemail.usu.edu>
pkgname=vim-cf3-git
pkgver=20130202
pkgrel=1
pkgdesc="VIM files to support Cfengine 3 policy editing"
arch=('i686' 'x86_64')
url="https://github.com/neilhwatson/vim_cf3"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=('vim-cf3')
conflicts=('vim-cf3')
source=('ftdetect.vim')

_gitroot='https://github.com/neilhwatson/vim_cf3.git'
_gitname='vim_cf3'

build() {
   cd "$srcdir/"
   msg "Connecting to GIT server..."
   if [ -d "$_gitname" ] ; then
     cd "$_gitname" && git pull origin
     cd "$srcdir"
     msg "The local files are updated."
   else
     git clone --depth=1 "$_gitroot" "$_gitname"
   fi
   msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"

  install -D -m644 ftplugin/cf3.vim "${pkgdir}/usr/share/vim/vimfiles/ftplugin/cf3.vim"
  install -D -m644 syntax/cf3.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/cf3.vim"
  install -D -m644 doc/cf3.txt "${pkgdir}/usr/share/vim/vimfiles/doc/cf3.txt"
  install -D -m644 "$srcdir/ftdetect.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/cf3.vim"
}
md5sums=('62f1a1611b07f266cc8b4e989921f6cd')
