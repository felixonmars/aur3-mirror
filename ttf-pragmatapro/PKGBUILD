pkgname=ttf-pragmatapro
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="PragmataPro proprietary ttf font"
arch=('any')
source=()
install=$pkgname.install
_fontpkg=pragmatapro08.zip
license=('http://www.fsd.it/fonts/eula.htm')
url='http://www.fsd.it/'

build()
{
  cd ${srcdir}
  
  msg "You need a full copy of this font in order to install it"
  msg "Searching for ${_fontpkg} in dir: $(readlink -f `pwd`/..)"
  if [[ -f "../${_fontpkg}" ]]; then
    msg "Found font package, installing..."
    ln -fs "../${_fontpkg}" .
    unzip ${_fontpkg} || true
  else
    error "Font package not found, please type absolute path to ${_fontpkg}:"
    read pkgpath
    if [[ -f "${pkgpath}/${_fontpkg}" ]]; then
      msg "Found font package, installing..."
      ln -fs "${pkgpath}/${_fontpkg}" .
      unzip ${_fontpkg} || true
    else
      error "Unable to find font package."
      return 1
    fi
  fi

  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/${_fontpkg%%.zip}/*.ttf $pkgdir/usr/share/fonts/TTF
}
