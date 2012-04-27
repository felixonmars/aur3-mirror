# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jacob Bang <julemand101@gmail.com>

pkgname=xblast
pkgver=2.10.4
pkgrel=4
pkgdesc="A multiplayer arcade game inspired by Bomberman and Dynablaster"
arch=('i686' 'x86_64')
url="http://xblast.sourceforge.net/"
license=('GPL')
depends=('libx11')
options=('!strip')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/images-2005-01-06.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/levels-2005-01-06.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/models-2005-01-06.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/musics-2005-01-06.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/sounds.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('eca7620c34ab49bb62fa8ef01f73b2f3'
         'f92d0965c759695e6a18310f885c6f40'
         'ea6277af0e97ad7eaea09370f4fe55ba'
         '887e84c9e7844823e3c8b59e63e8859b'
         'e721a2e448f81ca83d9a0a772251f611'
         '809c27f1002ad4d7aa836e083f52a199'
         'e34c0bd67915a7416ed6af6ebe25081c'
         '01b74714e6b5c11414d05b8d3d1962d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Copy data files to the source directory
  mkdir -p image/sprite level sounds
  cp -r ../images-2005-01-06/* image
  cp -r ../levels-2005-01-06/* level
  cp -r ../models-2005-01-06/* image/sprite
  cp -r ../musics-2005-01-06/* sounds
  cp -r ../sounds/* sounds

  # Fix non-Unicode filename and missing font error
  mv level/{rec*2,reconstruction2}.xal
  sed -i "s/helvetica/*/" x11_config.c

  # Compile
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-otherdatadir="/usr/share/${pkgname}" \
              --enable-sound \
              --enable-SMPF
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" prefix="${pkgidr}/usr" install
  find "${pkgdir}/usr/share/${pkgname}" -name Imakefile -delete

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS README "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${pkgname}.man" "${pkgdir}/usr/share/man/man6/${pkgname}.6"
}
