# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ShionjiYuuko <eien.mihoshi@gmail.com>
pkgname=mplayer2-build-repo
pkgver=2.0
pkgrel=2
epoch=
pkgdesc="mplayer2 official build repo with libass-0.9.13"
arch=('i686' 'x86_64')
url="http://www.mplayer2.org"
license=('GPL')
groups=()
depends=('fontconfig' 'libgl' 'libxv' 'libxss' 'fribidi' 'libxxf86dga' 'sdl' 'ttf-dejavu')
makedepends=('live-media' 'mesa' 'python2' 'unzip' 'videoproto' 'yasm')
checkdepends=()
optdepends=()
provides=('mplayer')
conflicts=('mplayer' 'mplayer2')
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ftp.mplayer2.org/pub/release/mplayer2-build-2.0.tar.xz
        http://libass.googlecode.com/files/libass-0.9.13.tar.xz)
noextract=()
md5sums=('05b93784de995235e2758f182de15f73'
         'd99381922dcbeb7a766d2e7825cca193') #generate with 'makepkg -g'

build() {
  cd "$srcdir/mplayer2-build-$pkgver"
  echo "
    --prefix=/usr
    --enable-translation
    --language=en ja
    --confdir=/etc/mplayer" > mplayer_options
  msg "Replacing libass with ver 0.9.13"
  rm -r "libass"
  mv "$srcdir/libass-0.9.13" "./libass"
  grep -r -lZ '/usr/bin/env python[^23]*' . 2>/dev/null | while read -rd '' file; do sed -i '1s:\<python\>:&2:' "$file"; done
  msg "Starting make..."
  make -j 6
}

package() {
  cd "$srcdir/mplayer2-build-$pkgver"
  #make DESTDIR="${pkgdir}" install #somehow error in the makefile install script, fallback to the dirty fix
  mkdir "${pkgdir}/usr"
  mkdir "${pkgdir}/usr/bin"
  install -Dm755 "mplayer/mplayer" "${pkgdir}/usr/bin/mplayer"
  mkdir "${pkgdir}/etc"
  mkdir "${pkgdir}/etc/mplayer"
  install -m644 mplayer/etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
  install -D "mplayer/DOCS/man/en/mplayer.1" "${pkgdir}/usr/share/man/man1/mplayer.1"
  msgfmt -o mplayer.mo "mplayer/po/ja.po"
  install -D "mplayer.mo" "${pkgdir}/usr/share/locale/ja/LC_MESSAGES/mplayer.mo"
  install -d -m755 "${pkgdir}/usr/share/mplayer"
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}/usr/share/mplayer/subfont.ttf"
  install -Dm644 "mplayer/etc/mplayer.desktop" "${pkgdir}/usr/share/applications/mplayer.desktop"
  install -Dm644 "mplayer/etc/mplayer.xpm" "${pkgdir}/usr/share/pixmaps/mplayer.xpm"
}

# vim:set ts=2 sw=2 et:
