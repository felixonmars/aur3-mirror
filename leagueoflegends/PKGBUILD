# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=leagueoflegends
pkgver=0.0.0
pkgrel=4
pkgdesc="A game by Riot"
arch=('i686' 'x86_64')
url="http://leagueoflegends.com/"
license=('custom')

strip_multilib() {
  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
}

depends=(
  fontconfig      lib32-fontconfig
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  winetricks      desktop-file-utils
)
makedepends=(autoconf ncurses bison perl fontforge flex prelink
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  giflib          lib32-giflib
  libpng          lib32-libpng
  gnutls          lib32-gnutls
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libxml2         lib32-libxml2
  libldap         lib32-libldap
  lcms            lib32-lcms
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  libxcomposite   lib32-libxcomposite
  mesa            lib32-mesa
  samba
)

if [[ $CARCH == x86_64 ]]; then
  strip_multilib
fi
options=(!libtool)
install=leagueoflegends.install
source=("http://sourceforge.net/projects/wine/files/Source/wine-1.5.18.tar.bz2"
        "wine-owner.patch"
        "lol.patch"
        "leagueoflegends"
        "http://l3cdn.riotgames.com/Installer/SingleFileInstall/LeagueOfLegendsBaseEUW.exe"
        "lol_setup.iss")

sha256sums=('a144900cc20e55623c8c9ab26e265eb2e76d88c9e21bd21a3bcfa030fdb3fbdf'
            'f54f34e1607b9bf7cd27009fc3ce120b6f228e2efe3d5cf00531e695dfae079b'
            '72f63a256b55a046a81d6e0514f9391e5b6f282b0fecd7092af7d5116606b170'
            'a1056cb6800d0f63cd9dd33e2e09ac54afe4ac9dbd3ba2bed573fca352820217'
            '6365a39634ea37398a604555a6c21d4ecf7d49cb9a74715d10e4fa939f0453c4'
            'c7a82b96986474d06badbbee62c2bdc3ce9e3e10789c0d0cf3709f0ad38f2aff')

_wine_version=$(echo ${source[0]} | grep -Eo "([0-9]+\.){2}[0-9]+")

build() {
  cd "$srcdir/wine-$_wine_version/"
  for _patch in ${source[*]}; do
    if [[ "$_patch" == *".patch" ]]; then
      patch -p1 < "../$_patch"
    fi
  done
  ./configure --prefix=/usr
  if [ $(nproc) ]; then
    make -j$(nproc)
  else
    make -j2
  fi
}

package() {
  install -dm755 "$pkgdir/opt"
  install -dm755 "$pkgdir/opt/lol"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/opt/lol/install"

  cd "$srcdir/wine-$_wine_version/"
  make DESTDIR="$pkgdir/opt/lol" install

  install -Dm754 "$srcdir/leagueoflegends" "$pkgdir/usr/bin/leagueoflegends"
  install -Dm644 "$srcdir/LeagueOfLegendsBaseEUW.exe" "$pkgdir/opt/lol/install/"
  install -Dm644 "$srcdir/lol_setup.iss" "$pkgdir/opt/lol/install/"
}

# vim:set ts=2 sw=2 et:
