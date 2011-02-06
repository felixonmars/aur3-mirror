# $Id$
# Maintainer: Daniel Corson <dancor@gmail.com>
pkgname=chessdb-beta
pkgver=3.6.19_beta_1
_source_name=ChessDB-${pkgver//_/-}
pkgrel=1
pkgdesc="Free chess database"
# Note on x86_64 at least I had to disable "Options -> Autosave on Exit"
# because an error was preventing exit otherwise..
arch=('i686', 'x86_64')
url="http://chessdb.sourceforge.net"
license=('GPL')
depends=(tk)
source=(http://downloads.sourceforge.net/chessdb/$_source_name.tar.gz)
md5sums=('de7a158e90102c905a0c65240a289934')

build() {
  cd $startdir/src/$_source_name
  
  _bindir="/usr/bin"
  _sharedir="/usr/share/chessdb"
  _soundsdir="$_sharedir/sounds"
  _tbdir="$_sharedir/tablebases"
  _mandir="/usr/man"
        
  # Should the upstream Makefile be changed to simplify this?
  ./configure \
    BINDIR="$_bindir" \
    SHAREDIR="$_sharedir" \
    SOUNDSDIR="$_soundsdir" \
    TBDIR="$_tbdir" \
    MANDIR="$_mandir"
  
  make || return 1

  # Upstream "make install" seems to be broken (refers to both $(SHAREDIR) and
  # $(DESTDIR)$(SHAREDIR) as if both are full paths?)
  #
  #make \
  #  DESTDIR="$pkgdir" \
  #  SHAREDIR="$pkgdir$_sharedir" \
  #  SOUNDSDIR="$pkgdir$_soundsdir" \
  #  TBDIR="$pkgdir$_tbdir" \
  #  MANDIR="$pkgdir$_mandir" \
  #  install

  _sounds=( sounds/Back.wav sounds/1.wav sounds/2.wav sounds/3.wav \
    sounds/4.wav sounds/5.wav sounds/6.wav sounds/7.wav sounds/8.wav \
    sounds/CastleK.wav sounds/Bishop.wav sounds/CastleQ.wav \
    sounds/Check.wav sounds/King.wav sounds/Knight.wav sounds/Mate.wav \
    sounds/Promote.wav sounds/Queen.wav sounds/Rook.wav sounds/a.wav \
    sounds/b.wav sounds/c.wav sounds/d.wav sounds/e.wav sounds/f.wav \
    sounds/g.wav sounds/h.wav sounds/x.wav )
  _scripts=( sc_addmove sc_epgn sc_spell sc_eco sc_import sc_remote \
    sc_tree chessdbpgn pgnfix spliteco )
  _execs=( pgnchessdb tkchessdb tcchessdb scmerge chessdblet )
  _man6=( manpages/chessdb.6 )

  install -m 755 -d "$pkgdir$_sharedir"
  install -m 755 -d "$pkgdir$_bindir"
  install -m 755 -d "$pkgdir$_soundsdir"
  # Tablebases dir is created but empty; files are meant to be installed
  # separately.
  install -m 755 -d "$pkgdir$_tbdir"
  install -m 755 -d "$pkgdir$_mandir"/man6
  install -m 644 -p "${_sounds[@]}" "$pkgdir$_soundsdir"
  install -m 644 -p "${_man6[@]}" "$pkgdir$_mandir"/man6
  install -m 755 chessdb "${_scripts[@]}" "${_execs[@]}" "$pkgdir$_bindir"
  install -m 755 -d "$pkgdir/$_sharedir"
  install -m 644 -p chessdb.eco ratings.ssp "$pkgdir$_sharedir"
}
