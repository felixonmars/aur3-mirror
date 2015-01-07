# Maintainer: jokot3 <jokot3 at gmail dot com>
# Contributor: enzzzy <enzzzy ta gmail dot com>

pkgname=gnuplot-nox
_pkgname=gnuplot
pkgver=5.0.0
pkgrel=3
pkgdesc="Plotting package which outputs PostScript, PNG, GIF, and others. Without X/cairo/wxgtk/lua/tex support." 
arch=('i686' 'x86_64') 
url="http://www.gnuplot.info" 
provides=('gnuplot')
conflicts=('gnuplot')
license=('custom') 
depends=('readline' 'gd' 'libjpeg')
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz" "gnuplot.install")
sha1sums=('ca5163e3cb466b4aeb878f1173b0fe624367f08a'
          '4f6c1568bf5b3252299547f6aa245a0b5f889b28')
install='gnuplot.install'

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Note : add --enable-backwards-compatibility if update to 5.0.0 broke something
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --disable-x11-mbfonts \
              --disable-x11-eternal \
              --disable-mouse \
              --disable-wxwidgets \
              --without-latex \
              --without-lua \
              --without-x \
              --without-cairo \
              --without-qt \
              --infodir=/usr/share/info \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --datadir=/usr/share \
              --with-readline=gnu \
              --with-bitmap-terminals 
  make pkglibexecdir=/usr/bin
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install

  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  # see https://mailman.archlinux.org/pipermail/aur-general/2013-November/026151.html
  cd "$pkgdir/usr/share/licenses/" && ln -s "$pkgname" "$_pkgname"

}

# vim:set ts=4 sw=4 et:
