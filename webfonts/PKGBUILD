# Maintainer: Daniel Nümm <dn@alphalog.ae>
pkgname=webfonts
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
makedepends=('mercurial')
pkgdesc="Over 200 Fonts from the Google Web Font Directory."
arch=('any')
url="http://www.google.com/webfonts"
license=('unknown')
conflicts=('')
install=$pkgname.install

_hgroot="https://googlefontdirectory.googlecode.com/hg/"
_hgname="googlefontdirectory"

build()
{
   cd "$srcdir"
   msg "Connecting to HG server...."
  
   if [ -d $_hgname ] ; then
      cd $_hgname && hg pull
      msg "The local files are updated."
   else
      hg clone $_hgroot $_hgname
   fi

   msg "HG checkout done or server timeout"
   msg "Starting make..."


  mkdir -p $pkgdir/usr/share/fonts/TTF
  find $srcdir/$hgname/ -iname '*.ttf'  -exec cp '{}' $pkgdir/usr/share/fonts/TTF/  \;
}

