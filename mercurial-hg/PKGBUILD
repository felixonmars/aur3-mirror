# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# $Id$

pkgname=mercurial-hg
pkgver=20080411
pkgrel=5
pkgdesc="A scalable distributed SCM tool compiled from the crew tree"
url="http://www.selenic.com/mercurial"
license=('GPL')
depends=('python>=2.4' 'mercurial' )
makedepends=('asciidoc' 'xmlto')
provides=('mercurial')
conflicts=('mercurial')
arch=('i686' 'x86_64')
source=()
md5sums=()

build() {
_hgroot=http://hg.intevation.org/mercurial/crew
_hgrepo=mercurial-hg

   cd ${startdir}/src

   if [ -d ${_hgrepo} ]; then
      cd ${_hgrepo}
      hg pull -u || return 1
   else
      hg clone ${_hgroot} ${_hgrepo} || return 1
      cd ${_hgrepo}
   fi

   msg "Mercurial checkout done or server timeout"
   msg "Starting make..."

   make PREFIX=${startdir}/pkg/usr  install || return 1
   install -d $startdir/pkg/usr/share
   install -m755 contrib/hgk $startdir/pkg/usr/bin
   install -m644 -D contrib/zsh_completion $startdir/pkg/usr/share/zsh/site-functions/_hg
   install -m644 -D contrib/bash_completion $startdir/pkg/etc/bash_completion.d/hg 
   install -d $startdir/pkg/usr/share/emacs/site-lisp
   install -m644 contrib/{mq.el,mercurial.el} $startdir/pkg/usr/share/emacs/site-lisp
   install -m644 -D contrib/vim/HGAnnotate.vim $startdir/pkg/usr/share/vim/syntax/HGAnnotate.vim
#
   install -d $startdir/pkg/usr/share/mercurial/vim
#   # Autoloading plugins to vim = no good.  
   install -m644 contrib/vim/* $startdir/pkg/usr/share/mercurial/vim
}


