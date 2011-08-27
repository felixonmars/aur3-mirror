# Maintainer: Adrián Chaves Fernández <adriyetichaves@gmail.com>

pkgname=racer-space
pkgname2=racer
pkgver=0.0.320
pkgrel=2
pkgdesc="Racer is a spaceship racing game, inspired by the F-Zero series."
arch=('i686' 'x86_64')
url="http://racer.sourceforge.net/"
license=('GPL3' 'custom:cc-by-2.0-UK')
depends=('sdl' 'ftgl' 'bullet' 'boost' 'glew' 'gtkmm' 'gtkglextmm')
makedepends=('glproto')
source=("http://sourceforge.net/projects/${pkgname2}/files/Source code/${pkgname2}-${pkgver}.tar.gz/download"
        "${pkgname2}.desktop"
        "${pkgname2}.sh"
        "${pkgname2}-editor.desktop"
        "${pkgname2}-editor.sh"
        "http://a.fsdn.com/con/icons/ra/${pkgname2}@sf.net/r48.png"
        "${pkgname2}.license")    
md5sums=('f84498492f0c3a61f520bef08e7a4c9f'
         '878ded015f34309d499a3028eb2cff79'
         '370c64f02ada877f4ac20fd20043550d'
         'edf36a3a32efb8ac428690745636df02'
         'd8f6c91f19cac599f96fbb6453301fa4'
         '90d253551beddd51eb30a7fce5423170'
         '6f8cb1c6db6bec251f92c5507c2f59e3')

build() {
  cd "${srcdir}/${pkgname2}-${pkgver}"
  
  # Enabling debug info in configuration...
  CPP_FLAGS=-I/usr/include/freetype2 ./configure --enable-debug || return 1
  
  # Speed up if x86_64...
  if [[ $CARCH = 'x86_64' ]]
    then
      make -j2 || return 1
    else
      make || return 1
  fi
  
  # Actual installation...
  mkdir -p ${pkgdir}/usr/local/games/${pkgname}/ || return 1
  cp -R ${srcdir}/${pkgname2}-${pkgver}/* $pkgdir/usr/local/games/${pkgname}/ || return 1
  
  # Adding execution files...
  install -D -m755 ${srcdir}/${pkgname2}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname2}-editor.sh $pkgdir/usr/bin/${pkgname}-editor
  
  # Installing logo and desktop entry...
  install -D -m644 $srcdir/${pkgname2}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
  install -D -m644 $srcdir/${pkgname2}-editor.desktop $pkgdir/usr/share/applications/${pkgname}-editor.desktop
  install -D -m644 $srcdir/r48.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  
  # Installing license...
  install -D -m644 $srcdir/${pkgname2}.license $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
