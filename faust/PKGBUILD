# Maintainer: rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=faust
pkgver=0.9.67
pkgrel=1
pkgdesc="A compiled language for real-time audio signal processing."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
depends=('ruby')
optdepends=('oscpack: osc support')
provides=('faust')
conflicts=('faust-git' 'faust2-git')
source=("http://sourceforge.net/projects/faudiostream/files/faust-$pkgver.zip")
md5sums=('c6bf6529a97a4861e4e752aaea8945fa')

#prepare() {
#	cd "$pkgname-$pkgver"
#}

build() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr
  ## you might want to install additional tools, eg.
  #cd tools/faust2appls/
  #sudo make install
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  
#  rm "$pkgdir"/usr/bin/faust2{max6,msp,vst}
#  rm "$pkgdir"/usr/lib/faust/vst*
#  rm "$pkgdir"/usr/lib/faust/max*
#  grep -l 'usr/local/' "$pkgdir"/usr/bin/faust2* |\
#    xargs sed -i 's|usr/local/|usr/|g'

  ## examples are placed in /usr/share/doc/faust - intended to be unpacked in user space
  tar czf faust-examples.tar.gz examples/
  echo 'Unpack examples in user space and look at examples/README for help' \
	>faust-examples.README
  ## docs
  install -m755 -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname" faust-examples.tar.gz faust-examples.README \
	README WHATSNEW documentation/faust{-quick-reference,-soft-computing,_tutorial}.pdf

  ## syntax highlighting files - choose what you need
  cd syntax-highlighting
  ## kate
  install -Dm644 $pkgname.xml  "$pkgdir/usr/share/apps/katepart/syntax/$pkgname.xml"
  ## gedit
  install -Dm644 $pkgname.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/$pkgname.lang"
  install -Dm644 $pkgname.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/$pkgname.lang"
  ## highlight 
  install -Dm644 dsp.lang      "$pkgdir/usr/share/highlight/langDefs/dsp.lang"
  ## vim
  install -Dm644 $pkgname.vim  "$pkgdir/usr/share/vim/vimfiles/syntax/$pkgname.vim"
}
