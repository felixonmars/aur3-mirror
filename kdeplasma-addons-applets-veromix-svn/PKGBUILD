# Maintainer: M0Rf30 < morf3089 at gmail dot com >

pkgname=kdeplasma-addons-applets-veromix-svn
pkgver=343
pkgrel=1
pkgdesc="A plasmoid mixer for the Pulseaudio sound server"
url="http://code.google.com/p/veromix-plasmoid/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('kdebindings-python' 'kdebase-workspace' 'python2-qt' 'pulseaudio' 'pyxdg')
conflicts=('kdeplasma-addons-applets-veromix')
makedepends=('svn')
optdepends=('pulseaudio-equalizer'
            'swh-plugins: equalizer and other effects support')
_svnmod="veromix"
_svntrunk="http://veromix-plasmoid.googlecode.com/svn/trunk/"

build() {

cd $srcdir/
	
	msg "Connecting to $_svnmod SVN server..."

  if [ -d $_svnmod ] ; then
    (cd $_svnmod && svn update)
    msg "The local files are updated."
  else
    svn co ${_svntrunk} ${_svnmod}
  fi


	msg "SVN checkout done or server timeout"
	cd ${_svnmod}
        install -dm755 ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid || return 1
	cp -R {contents,dbus-service,metadata.desktop} ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid || return 1
	install -Dm644 metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-veromix-plasmoid.desktop || return 1
  
	#fix for python
	sed -i -e '1 s/python/python2/' ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/dbus-service/VeromixServiceMain.py

}
