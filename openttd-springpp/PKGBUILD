pkgname=openttd-springpp
_installname=openttd
_gamever=1.5.0beta1
_svnver=27112
_patchver=2.2.192
pkgver=${_gamever}+r${_svnver}+p${_patchver}
pkgrel=1
pkgdesc="OpenTTD with the Spring 2013 Patch Pack"
arch=('i686' 'x86_64')
url="http://www.tt-forums.net/viewtopic.php?f=33&t=66892"
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme'
         'desktop-file-utils' 'xz' 'allegro4')
conflicts=('openttd')
install=openttd-springpp.install
optdepends=('openttd-opengfx-snapshot: free graphics'
            'openttd-opensfx: free soundset')

_folder="OpenTTD Spring2013 Patchpack v${_patchver} Full source"
source=("https://www.dropbox.com/sh/emb1vdfqc6rj9zf/AACNazxUhNT4LWjLgVHp1RGaa/OpenTTD Spring 2013 patchpack by PI1985/v2.0 Full/2015-01-06/${_folder}.7z")
#         'fontcache.patch')
md5sums=('d072681a1f3c60b02cfe784d228c00d6')
#          '48b3c77b113ec2f6caaaae15c60fc7f6')

prepare() {
  rm -rf openttd; mv -T "${_folder}" openttd
  
#   cd openttd
#   patch -p0 < "${startdir}"/fontcache.patch
}

build() {
  cd openttd
  
 ./configure \
    --prefix-dir=/usr \
    --binary-name=${_installname} \
    --binary-dir=bin \
    --data-dir=share/${_installname} \
    --install-dir="${pkgdir}" \
    --doc-dir=share/doc/${_installname} \
    --menu-name="OpenTTD" \
    --personal-dir=.${_installname}

  make
}

package() {
  cd openttd
  make install
  
  cp -rT bin/data "${pkgdir}"/usr/share/${_installname}/data
  cp -rT bin/game "${pkgdir}"/usr/share/${_installname}/game
}
