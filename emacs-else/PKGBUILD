# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-else 
pkgver=1.22
pkgrel=3
pkgdesc="Emacs Language Sensitive Editor -- minor mode to use language specific abbreviations"
url="http://home.comcast.net/~dharter46"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('texlive-core' 'texinfo')
source=(http://home.comcast.net/~dharter46/F90.lse \
  http://home.comcast.net/~dharter46/Fortran.lse \
  http://home.comcast.net/~dharter46/Pascal.lse \
  http://home.comcast.net/~dharter46/Perl.lse \
  http://home.comcast.net/~dharter46/bourne_shell.lse \
  http://home.comcast.net/~dharter46/c_shell.lse \
  http://home.comcast.net/~dharter46/cobol.lse \
  http://home.comcast.net/~dharter46/html.lse 
)
md5sums=('20c2a62baa6003a7b47ed5e1e431f63e'
         'b4dfed4cde67b665d90c5cdde6de1cc0'
         '34927e10b27fe4b6f2e0eb29d4a90d57'
         'aeb9af74d465dc5cf731c5a04edddf9a'
         '0913c21f7580e3f968c83a724268b1bc'
         'd91cb79da60553014671c38fbb8e9bf6'
         '6471ca39c0225dec9eef0d1a7335edce'
         '158319ed8675fb22f5ede3f25374cc91')
install=else.install

build() {
  cd $srcdir
  if [ -d $pkgname ] ; then
    cd $pkgname && git pull origin
    msg "The local files are updated."
  else
    git clone https://github.com/stefanhusmann/emacs-else.git $pkgname
    cd $pkgname
  fi
  makeinfo else.texi 
  pdftex else.texi 
  pdftex else.texi 
  pdftex else.texi 
  install -Dm644 else "$pkgdir"/usr/share/info/else.info 
  install -Dm644 else.pdf \
    "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf 
  sed -i 's/string-to-int/string-to-number/g' setnu.el 
  for _i in *.el
  do
    emacs -batch -q -f batch-byte-compile ${_i}
  done 
  install -d "$pkgdir"/usr/share/emacs/site-lisp 
  for _i in *.lse ../*.lse *.el *.elc
  do 
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp
  done 
}
