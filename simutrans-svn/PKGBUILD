# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=simutrans-svn
pkgver=3965
pkgrel=1
pkgdesc="An open source transportation simulation game (development version)"
arch=('i686' 'x86_64')
url="http://www.simutrans.com/"
license=('custom')
depends=('libpng' 'sdl' 'sdl_mixer' 'zlib' 'gcc-libs')
makedepends=('subversion')
provides=('simutrans')
conflicts=('simutrans' 'simutrans-pak64')
source=('based-on-svn-r3965.diff'
        'simutrans.desktop'
        'simutrans.xpm')
md5sums=('302ac245ad3941f5e618cf4c90ca962c'
         'c1f4ca9d58a00734bb192e4401d84d14'
         'ce0ccf73b9ea37d5ef17303bb7830dfe')

_svntrunk=svn://anon@tron.homeunix.org/simutrans/simutrans/trunk
_svnmod=simutrans
_revnumber=$pkgver

build() {
  cd "$srcdir"

# Prepare source
  msg "Connecting to $_svntrunk..."

  if [[ -d $_svnmod ]] ; then
    cd $_svnmod
    svn up --no-auth-cache --password "" -r $_revnumber || return 1
    cd ..
    msg "The local files are updated."
  else
    svn co --no-auth-cache --password "" -r $_revnumber $_svntrunk $_svnmod || return 1
  fi

  msg "SVN checkout done"

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

# Apply the patch
  msg "Patching..."
  patch -p1 < ../based-on-svn-r3965.diff || return 1

# Make now
  msg "Starting make..."
  make -C makeobj clean || return 1
  make makeobj_prog || return 1
  make || return 1

# Build skins (refs r223 of pak64 source)
  mkdir -p "$pkgdir/usr/share/simutrans/skin"
  makeobj/makeobj PAK "$pkgdir/usr/share/simutrans/skin/menu.WindowSkin.pak" \
      "skins.src/skins.dat" || return 1

# Install files
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/simutrans"
  mkdir -p "$pkgdir/usr/share/simutrans/font"
  mkdir -p "$pkgdir/usr/share/simutrans/music"
  mkdir -p "$pkgdir/usr/share/simutrans/text"
  mkdir -p "$pkgdir/usr/share/simutrans/config"

  install "sim" "$pkgdir/usr/bin/simutrans" || return 1
  install "makeobj/makeobj" "$pkgdir/usr/bin/makeobj" || return 1
  install -m644 "simutrans/config/simuconf.tab" "$pkgdir/usr/share/simutrans/config" || return 1
  install -m644 "simutrans/font/"* "$pkgdir/usr/share/simutrans/font" || return 1
  install -m644 "simutrans/music/"*.tab "$pkgdir/usr/share/simutrans/music" || return 1
  install -m644 "simutrans/music/"*.mid "$pkgdir/usr/share/simutrans/music" || return 1
  install -D -m644 "${srcdir}/simutrans.xpm" "${pkgdir}/usr/share/pixmaps/simutrans.xpm" || return 1
  install -D -m644 "${srcdir}/simutrans.desktop" \
      "${pkgdir}/usr/share/applications/simutrans.desktop" || return 1
  install -D -m644 "${srcdir}/simutrans/simutrans/licence.txt" \
      "${pkgdir}/usr/share/licenses/$pkgname/LICENSE" || return 1

# Download and install translations
  msg "Downloading translations ..."

  for _lang in cz de dk en es fi fr hr hu it ja ko nl pl pt ro ru sk sv tr zh ; do \
    wget "http://simutrans-germany.com/translator/data/tab/0/$_lang.tab" \
        -O "$pkgdir/usr/share/simutrans/text/$_lang.tab" || return 0
    mkdir "$pkgdir/usr/share/simutrans/text/$_lang"
    install -m644 "simutrans/text/$_lang/"*.txt "$pkgdir/usr/share/simutrans/text/$_lang" || return 0
  done

}
