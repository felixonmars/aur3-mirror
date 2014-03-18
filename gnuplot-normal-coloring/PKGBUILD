# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot-normal-coloring
pkgver=4.6.5
pkgrel=1
pkgdesc="Gnuplot patched to support normal vector coloring similar to Matlab or Mathematica" 
arch=('i686' 'x86_64') 
url="http://www.gnuplot.info" 
license=('custom') 
depends=('readline' 'gd' 'wxgtk2.8' 'cairo' 'libjpeg' 'lua' 'qt4' 'gnutls') 
makedepends=('emacs' 'texinfo' 'texlive-core' 'texlive-latexextra')
provides=('gnuplot')
conflicts=('gnuplot')
options=('!makeflags')
install=gnuplot.install
source=("http://downloads.sourceforge.net/sourceforge/gnuplot/gnuplot-$pkgver.tar.gz" \
        "doug-normal-shade-fixed-v2.patch")
md5sums=('9a476b21f74bd99c876f1509d731a0f9'
         'ed56a95e254f5256976e421990a9edcd')

prepare() {
  cd "$srcdir/gnuplot-$pkgver"

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  patch -Np1 < "$srcdir/doug-normal-shade-fixed-v2.patch"
}

build() {
  cd "$srcdir/gnuplot-$pkgver"

   WX_CONFIG=/usr/bin/wx-config-2.8 ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu --enable-qt
  make pkglibexecdir=/usr/bin
}

package() {
  cd "$srcdir/gnuplot-$pkgver"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install install-info

  install -Dm644 lisp/dotemacs "$pkgdir/usr/share/emacs/site-lisp/dotemacs"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/gnuplot/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
}
