# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=analogue
pkgver=1.3
pkgrel=6
pkgdesc="Analogue: A Hate Story"
arch=('i686' 'x86_64')
url="http://ahatestory.com/"
license=('custom')
install=analogue.install

# For x86_64, I guess I should add some lib32- stuff to depends.  I really
# don't know and cba'd to find out which ones are needed.

: ${_trial=yes}

# If you set _trial=no, you will need to download the game files yourself (this
# includes .tar.bz2 and dlc1.rpa).

case $_trial in
y|yes|true) _version="Trial-$pkgver"
            _url="http://ahatestory.com/"
            _dlc=()
            _dlc_sha1sum=()
            ;;
n|no|false) _version="$pkgver"
            _url="."
            _dlc=("dlc1.rpa")
            _dlc_sha1sum=('55bf01404df8752843eee4adfa2c9b31ceaba864')
            ;;
esac

case $_version in
1.2)        _game_sha1sum='db8ac00dcce3df311c1e9ce93e11e01eea8c37ee';;
1.3)        _game_sha1sum='2286cac8b2b773fc5027391aeb081c5257e32c02';;
Trial-1.2)  _game_sha1sum='5e26ab939b83313c3e41ad90f7c5e92c0c6dd45d';;
Trial-1.3)  _game_sha1sum='672ec21a67ffd5dd9dd0820322cbc3a71069120b';;
esac

source=("$_url/Analogue-$_version-linux-x86.tar.bz2"
        "${_dlc[@]}"
        "analogue.bin.sh"
        "analogue.desktop"
        "analogue-256.png"
        "analogue-128.png"
        "analogue-48.png"
        "analogue-32.png"
        "analogue-16.png")
sha1sums=("$_game_sha1sum"
          "${_dlc_sha1sum[@]}"
          'SKIP'
          '3423a2d084986efb6dac6066388f96be31782e7d'
          'cce341e2d832c53881a2692ec5735d61c54b3edb'
          'c3e23b21a689afe736b963d11aa05907a4f97544'
          '78e893061f85679c71ba719df6bce1ba9a13f385'
          '7fca88c907f10ef8934c0e75bf062ae029c59ba4'
          '54df2190e4a7742fe697e9bd8ff7b17176401f9b')

package() {
  cd "$srcdir"
  install -dm0755 "$pkgdir/opt"
  cp -a "Analogue-$pkgver-linux-x86" "$pkgdir/opt/analogue"
  install -Dm0644 "dlc1.rpa"         "$pkgdir/opt/analogue/game/dlc1.rpa"
  install -Dm0755 "analogue.bin.sh"  "$pkgdir/usr/bin/analogue"
  install -Dm0644 "analogue.desktop" "$pkgdir/usr/share/applications/analogue.desktop"
  for size in 256 128 48 32 16; do
    install -Dm0644 "analogue-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/analogue.png"
  done
}

# vim:set ts=2 sw=2 et:
