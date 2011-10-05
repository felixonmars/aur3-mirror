# Maintainer: Evan Gates (emg) <evan.gates@gmail.com>

pkgname=ii-emg-hg
pkgver=117
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based IRC client. (emg's version)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/emg/ii-emg/overview"
license=('GPL')
depends=('glibc')
makedepends=('mercurial')
provides=('ii')
conflicts=('ii')

_hgroot="https://bitbucket.org/emg"
_hgrepo="ii-emg"

build() {
	cd "$srcdir"
	msg "Connecting to Mercurial server...."

	if [ -d $_hgrepo ] ; then
		cd $_hgrepo
		hg pull -u
		msg "The local files are updated."
	else
		hg clone $_hgroot $_hgrepo
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_hgrepo-build"
	cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"

	# switch to branch emg
	hg up emg

	# Use this to set the irc path in query.sh to ~/.irc if you wish
	#  sed -i 's|IRCPATH=$HOME/irc|IRCPATH=$HOME/.irc|' query.sh

	sed -i "s|CFLAGS = |CFLAGS = ${CFLAGS} |" config.mk
}

package() {
	cd "$srcdir/$_hgrepo-build"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
	chmod 755 "$pkgdir/usr/bin/ii"
	install -D -m644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/license.txt"
} 
