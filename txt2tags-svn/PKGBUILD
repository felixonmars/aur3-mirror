# Maintainer: Jason Mirate <mmirate at ymail dot com>

pkgname=txt2tags-svn
pkgver=643
pkgrel=2
pkgdesc="A text formatting and conversion tool to (X)HTML, LaTeX, DocBook, and more."
arch=('any')
url="http://txt2tags.sf.net"
license=('GPL')
conflicts=('txt2tags')
provides=('txt2tags')
depends=('python2')
optdepends=('ruby: for running t2tmake.rb' 'sh: for running html-update.sh' \
  'vim: for using the vim-files')
makedepends=('gettext' 'subversion')

_svntrunk='http://txt2tags.googlecode.com/svn/trunk/'
_svnmod='txt2tags-read-only'

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  # python2 fix
  for file in txt2tags extras/gensite; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
      sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
  done
}

package() {
  install -d $pkgdir/usr/share/vim/vimfiles/{plugin,syntax,compiler,macros}
  install -d $pkgdir/usr/share/man/{it,pt_BR,fr,es,ca}/man1
  install -d $pkgdir/usr/share/man/man1
  cd "$srcdir/$_svnmod-build"
  install -Dm755 txt2tags $pkgdir/usr/bin/txt2tags
  install -Dm644 extras/pagemaker.vim \
    $pkgdir/usr/share/vim/vimfiles/syntax/pagemaker.vim
  install -Dm644 extras/txt2tags.vim \
    $pkgdir/usr/share/vim/vimfiles/syntax/txt2tags.vim
  install -Dm644 extras/gvim-menu.vim \
    $pkgdir/usr/share/vim/vimfiles/plugin/txt2tags-gvim-menu.vim
  install -Dm644 extras/txt2tags-compiler.vim \
    $pkgdir/usr/share/vim/vimfiles/compiler/txt2tags-compiler.vim
  install -Dm644 extras/unhtml.vim \
    $pkgdir/usr/share/vim/vimfiles/macros/unhtml.vim

    # Installing other extra tools
  install -m755 extras/{t2tmake.rb,gensite,html-update.sh} \
    $pkgdir/usr/bin
  install -Dm644 extras/txt2tags-mode.el \
    $pkgdir/usr/share/emacs/site-lisp/txt2tags-mode.el
  
    # Handling the manpage (DEPRECATED HACK)
  #cd doc
  #for _language in {"it","pt","fr","es","ca"}; do
  #  install -Dm644 manpage-${_language}.man txt2tags.1-${_language};
  #  if [ ${_language} == "pt" ]; then
  #    cp txt2tags.1-${_language} \
  #      $pkgdir/usr/share/man/pt_BR/man1/txt2tags.1;
  #  else
  #    install -Dm644 txt2tags.1-${_language} \
  #      $pkgdir/usr/share/man/$language/man1/txt2tags.1;
  #  fi
  #done

        # Handling the manpage
  cd doc
  _languages=('Basque' 'Catalan' 'Chinese' 'French' 'Italian' 'Portuguese' 'Spanish')
  _languages_short=('eu' 'ca' 'zh' 'fr' 'it' 'pt' 'es')
  _numbers=(0 1 2 3 4 5)
  for _number in ${_numbers[@]}; do
    #echo $_number
    #echo ${_languages_short[${number}]}
    cd "${_languages[$_number]}"
    #_manpagename=$(find -name "manpage-${languages_short[${_number}]}.man")
    _manpagename=$(find -name "manpage-*.man")
    #echo $_manpagename
    install -Dm644 $_manpagename $pkgdir/usr/share/man/${_languages_short[${number}]}/man1/txt2tags.1
    cd ..
    #pwd
  done

        # English manpage
  install -Dm644 English/manpage.man $pkgdir/usr/share/man/man1/txt2tags.1
  cd ../po
  for _i in *.po
  do
    msgfmt -o ${_i%.po}.mo ${_i}
    install -Dm644 ${_i%.po}.mo \
      $pkgdir/usr/share/locale/${_i%.po}/LC_MESSAGES/txt2tags.mo
  done
}
