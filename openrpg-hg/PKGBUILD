# Contributor: Aaron Fellin <fellaaron@gmail.com>

pkgname=openrpg-hg
pkgver=1.7.7
pkgrel=5
pkgdesc="Online real-time RPG tabletop simulator allowing online play."
url="http://www.openrpg.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('wxpython')
makedepends=('mercurial')
conflicts=('openrpg')
source=(openrpg-server-gui.sh openrpg-server.sh openrpg.desktop openrpg.sh
        cherrypy.patch xxinit2.patch)
md5sums=('be168360cb09636d9a209a47cf5bf44a'
         'dd9d9412bcc8552ad5840c4eca9811e2'
				 '1aafa7772050bc66503420824a201b2d'
				 'df7635a7a6721c82c07935e1260001df'
				 'd5c7d56aa4dc99dca80a6e54a2a16d81'
				 '8ea395f0b10a685b11f3e57d1a79ee68')

_hgroot="http://hg.assembla.com/openrpg"

build() {
	cd ${srcdir}
	msg "Downloading source from ${_hgroot}"

	if [ -d openrpg ] ; then
		cd openrpg
		hg pull -q "${_hgroot}" || return 1
	else
		hg clone -q "${_hgroot}" || return 1
		cd openrpg
	fi

	# apply patches
	msg "Applying patches"
	patch "plugins/xxinit2.py" "${srcdir}/xxinit2.patch"
	patch "plugins/cherrypy/_cphttptools.py" "${srcdir}/cherrypy.patch"

	# The rest of this shamelessly stolen from the openrpg-1.7.1-2 PKGBUILD
  # Install files into /usr/bin 
  install -m755 -D $startdir/src/openrpg.sh $startdir/pkg/usr/bin/openrpg
  install -m755 -D $startdir/src/openrpg-server.sh $startdir/pkg/usr/bin/openrpg-server
  install -m755 -D $startdir/src/openrpg-server-gui.sh $startdir/pkg/usr/bin/openrpg-server-gui

	# Create installation DIR and install files to it
  install -m755 -d $startdir/pkg/usr/share/openrpg

	# Install the rest
  cp -a * $startdir/pkg/usr/share/openrpg || return 1

  # Pre-compile to .pyc - again, so pacman knows about it
  find $startdir/pkg/usr/share/openrpg -type d -exec python -m compileall {} \;

  # Finally, install .desktop file
  install -D -m644 ../openrpg.desktop $startdir/pkg/usr/share/applications/openrpg.desktop
}
