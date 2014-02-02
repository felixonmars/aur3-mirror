# Maintainer: frabjous <klement at philos dot umass edu>
pkgname=vim-live-latex-preview
pkgver=0.9
pkgrel=1
pkgdesc="Vim plugin and helper scripts to provide a live-updating PDF preview of LaTeX documents with MuPDF"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=107164"
license=('GPL')
depends=('texlive-core' 'vim' 'xdotool' 'mupdf')
source=(http://people.umass.edu/umass298y-klement/${pkgname}-${pkgver}.tar.gz) 
md5sums=('3a1d506673ba6c5556d502c0c9d4cdb3')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/vim/vimfiles/ftplugin/tex
  mv *.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/tex
  mv *.txt $pkgdir/usr/share/vim/vimfiles/ftplugin/tex
  chmod a+x *.sh
  mkdir -p $pkgdir/usr/bin
  mv *.sh $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
