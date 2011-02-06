pkgname=doom2
pkgver=1.0
pkgrel=1
pkgdesc="Doom 2 shooter game"
arch=(any)
url="http://oldgames.ru"
license=('custom')
depends=(dosbox bash)
makedepends=(unrar)
source=('http://oldgames.ru:8080/D/Doom_2.rar')
md5sums=('ac2299f9dd3f066c7d7b568f555fee07')

build() {
  cd "$srcdir/"
  unrar x 'Doom_2.rar' || return 1

  local game=doom2

  rm -f Doom\ 2/*.PIF

  mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin/
  cp -r "Doom 2" $pkgdir/usr/share/$game || return 1

  cat >$pkgdir/usr/bin/$game <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/$game ]; then
	mkdir -p ~/.dosbox/$game
	cd ~/.dosbox/$game
	ls -1 /usr/share/$game | while read A; do
		ln -s /usr/share/$game/\$A \$A
	done

	rm -f DEFAULT.CFG zdoom.cfg MODEM.CFG
	cp /usr/share/$game/DEFAULT.CFG /usr/share/$game/zdoom.cfg /usr/share/$game/MODEM.CFG ./
fi
cd ~/.dosbox/$game
dosbox -c 'mount c ~/.dosbox/$game' -c 'c:' -c '$game' -c 'exit'
EOF

  chmod 0755 $pkgdir/usr/bin/$game
}
