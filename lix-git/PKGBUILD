# Maintainer: Carl Reinke <mindless2112 gmail com>

pkgname=lix-git
pkgver=20150203.714.abdbc16
pkgrel=1
pkgdesc="an action-puzzle game in the IRS (Interactive Rodent Simulation) genre (like Lemmings)"
url="http://asdfasdf.ethz.ch/~simon/"
license=('custom')
source=('lix::git://github.com/SimonN/Lix.git'
        'lix.launcher'
        'lixd.launcher'
        'lix.png'
        'lix.desktop')
md5sums=('SKIP'
         '55a17a99eed2ca312176bfb330e3c3f1'
         '766cfcdb7e9c861c57153bbf86e15c7b'
         '19cede8ac55382151127c22ad80dc47f'
         'a0a5d058c60d3ea48d09c010699600b5')
arch=('i686' 'x86_64')
depends=('allegro4' 'enet')
makedepends=('git')

pkgver()
{
	cd "$srcdir/lix"
	
	printf "%s.%s.%s" "$(git log -1 --format="%cd" --date=short | sed 's|-||g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "$srcdir/lix"
	
	make
}

package()
{
	cd "$srcdir/lix"
	
	install -dm755 -ggames  "$pkgdir/opt/lix"
	install -Dm755 bin/lix  "$pkgdir/opt/lix/lix"
	install -Dm755 bin/lixd "$pkgdir/opt/lix/lixd"
	cp -R data/ doc/ images/ levels/ replays/ "$pkgdir/opt/lix/"
	
	install -Dm755 "$srcdir/lix.launcher"  "$pkgdir/usr/bin/lix"
	install -Dm755 "$srcdir/lixd.launcher" "$pkgdir/usr/bin/lixd"
	install -Dm644 "$srcdir/lix.png"       "$pkgdir/usr/share/pixmaps/lix.png"
	install -Dm644 "$srcdir/lix.desktop"   "$pkgdir/usr/share/applications/lix.desktop"
	
	cd "$pkgdir"
	
	chown -R :games opt/lix/*
	chmod -R 644 opt/lix/doc
	chmod -R 664 opt/lix/{data,images,levels,replays}
	find opt/lix/ -type d -exec chmod a+x \{\} \;
}
