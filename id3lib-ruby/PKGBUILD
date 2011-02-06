# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: enderst  <enderst@gmail.com>
pkgname=id3lib-ruby  
pkgver=0.5.0
pkgrel=22
pkgdesc="a Ruby interface to the id3lib C++ library for editing ID3 tags (v1 and v2) of MP3 audio files."
url="http://id3lib-ruby.rubyforge.org/"
arch=('i686')
license=('GPL')
depends=('ruby' 'id3lib')
source=(http://rubyforge.org/frs/download.php/15638/$pkgname-$pkgver.tar.gz)
md5sums=('ceddb542b80c72aa9589a140aacfceda')
build() {
  cd $startdir/src/$pkgname-$pkgver
  export CONFIGURE_ARGS="--with-opt-dir=$startdir/pkg/usr"
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}
