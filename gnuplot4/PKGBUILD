# Copy-Paste from extra/gnuplot-4.6.6 PKGBUILD
# by ertua <mfl.34.qal@spamgourmet.com>
# Original author information:
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot4
_pkgname=gnuplot
pkgver=4.6.6
pkgrel=1
pkgdesc="Plotting package, 4.x legacy branch"
arch=('i686' 'x86_64')
url="http://www.gnuplot.info"
license=('custom')
depends=('readline' 'gd' 'wxgtk2.8' 'cairo' 'libjpeg' 'lua' 'qt4' 'gnutls')
makedepends=('texinfo' 'emacs' 'texlive-core' 'texlive-latexextra')
provides=('gnuplot')
conflicts=('gnuplot')
#options=('!makeflags')
install=gnuplot.install
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-$pkgver.tar.gz"
"lua53_compat.patch")
sha1sums=('012bd22b7be32da186b6bb015c0c6d876926c90b'
'9005fa9e4da91ceedb8ccd1d761866e7b064f8b1')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  patch -p1 < "$srcdir"/lua53_compat.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

   WX_CONFIG=/usr/bin/wx-config-2.8 ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu --enable-qt
  make pkglibexecdir=/usr/bin
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install install-info

  install -Dm644 lisp/dotemacs "$pkgdir/usr/share/emacs/site-lisp/dotemacs"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
}
