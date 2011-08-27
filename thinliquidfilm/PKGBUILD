# Original Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=thinliquidfilm
pkgver=1.00
pkgrel=5
pkgdesc="Convert video files into a format suitable for playing on the video capable ipods"
arch=('i686')
url="http://www.thinliquidfilm.org"
license=('GPL2')
depends=('libgpod' 'pyqt3' 'ffmpeg')
install=thinliquidfilm.install
source=(http://www.thinliquidfilm.org/tlf-1.00.tar.bz2 
        thinliquidfilm.desktop
        # Fixes to make TLF work with current Arch ffmpeg
        0001-Fix-syntax-of-ffmpeg-interactions.patch
        0002-Fix-regular-expression-matching-of-ffmpeg-output.patch
        0003-Fix-change-of-motion-estimation-command-line-param.patch
       )
build() {
  cd "$startdir/src/$pkgname"

  msg "Applying patches"
  for file in `dir -d ../*.patch` ; do
     echo "  ${file:3}"
     patch -p1 < $file
  done


  install -d $startdir/pkg/usr/bin
  mv StuffIt\ Expander.png StuffIt_Expander.png
  for i in *.py; do
    install -D -m755 $i $startdir/pkg/usr/share/$pkgname/$i
  done
  for i in *.png; do
    install -m644 $i $startdir/pkg/usr/share/$pkgname/$i
  done
  ln -sf /usr/share/thinliquidfilm/thinliquidfilm.py $startdir/pkg/usr/bin/thinliquidfilm
  install -D -m644 ../thinliquidfilm.desktop $startdir/pkg/usr/share/applications/thinliquidfilm.desktop

}
md5sums=('2f4192945cd3b381fd62c76bf9e819fe'
         '6c66429ad64806fc4fba489bdd8ce47f'
         '566aa6e66f9d2077da071c5759522f94'
         '451d5ad3cb7bb577174d4d21f7bf57e4'
         'f0d8ecdcc1a027893a329452ef6898bc')
