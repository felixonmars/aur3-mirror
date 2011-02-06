pkgname=jack-audio-connection-kit-svn
pkgver=4094
pkgrel=1
pkgdesc="A low-latency audio server for multiprocessor machines"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
depends=('dbus-core' 'python2' 'libsamplerate' 'celt' 'ffado')
makedepends=('python-waf')
provides=('jack-audio-connection-kit')
conflicts=('jack-audio-connection-kit-mp' 'jack')
url="http://www.grame.fr/~letz/jackdmp.html"
backup=('etc/conf.d/jack-audio-connection-kit')
options=('!libtool')
source=(jack-audio-connection-kit
jack-audio-connection-kit1
jack.sh)
md5sums=('5504df77df2ac9680f990c699c9210ae'
'112bbf9583793c3e7480e1da91150a14'
'd784fa8b6d98d27699781bd9a7cf19f0')
_svnmod="jackmp"
_svntrunk="http://subversion.jackaudio.org/jack/jack2/trunk/"

build() {

cd $startdir/src/
	mkdir -p ~/.subversion; touch ~/.subversion/servers
	msg "Connecting to $_svnmod.sf.net SVN server..."

#	svn co $_svntrunk $_svnmod

  if [ -d $_svnmod ] ; then
    (cd $_svnmod && svn update)
    msg "The local files are updated."
  else
    svn co ${_svntrunk} ${_svnmod}
  fi


	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	#mkdir -p $startdir/pkg/usr/


msg ${startdir} startdir
  cd ${startdir}/src/$_svnmod/jackmp
  python2 waf configure --classic --profile  --enable-pkg-config-dbus-service-dir --alsa --firewire --prefix=/usr || return 1
  python2 waf build || return 1
  python2 waf install --destdir=${startdir}/pkg
  mkdir -p $startdir/pkg/etc/rc.d
  mkdir -p $startdir/pkg/etc/conf.d
  mkdir -p $startdir/pkg/etc/profile.d
  cp $startdir/src/jack.sh  $startdir/pkg/etc/profile.d
  cp $startdir/src/jack-audio-connection-kit  $startdir/pkg/etc/rc.d
  cp $startdir/src/jack-audio-connection-kit1  $startdir/pkg/etc/conf.d/jack-audio-connection-kit
 }