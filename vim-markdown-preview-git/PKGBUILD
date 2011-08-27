# Maintainer: Alexander Yunin <iflo0[dot]myhotspot[at]ru>
# You need vim compiled with ruby support
pkgname=vim-markdown-preview-git 
pkgver=1.2.1
pkgrel=5
pkgdesc="Preview markdown documents in HTML/PDF from Vim"
arch=('any')
url="http://github.com/iflo0/vim-markdown-preview"
license=('GPL')
groups=('vim-plugins')
depends=('vim' 'wkhtmltopdf')
makedepends=('git')
install=vmp.install

_gitroot="http://github.com/iflo0/vim-markdown-preview.git"
_gitname="vim-markdown-preview"

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

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
}

package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,vim-markdown-preview} \
             ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/{stylesheets,kramdown,pdfkit} \
             ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/kramdown/{converter,parser,utils,parser/kramdown}

  install -Dm644 LEGAL ${pkgdir}/usr/share/licenses/${pkgname}/LEGAL || return 1;
  install -Dm644 doc/vmp.txt ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1;
  install -Dm755 plugin/vmp.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1;
  install -Dm755 vim-markdown-preview/*rb ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/ || return 1;
  install -Dm644 vim-markdown-preview/pdfkit/LICENSE ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/pdfkit/ || return 1;


cd vim-markdown-preview 
  for x in kramdown/parser/kramdown kramdown/utils kramdown/parser kramdown/converter stylesheets kramdown pdfkit; do
      install -Dm755 $x/*.rb ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/$x/ || \
      install -Dm755 $x/*.css ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/$x/ || return 1;
  done

cd kramdown
  install -Dm644 COPYING ${pkgdir}/usr/share/vim/vimfiles/vim-markdown-preview/kramdown/COPYING || return 1;
}
