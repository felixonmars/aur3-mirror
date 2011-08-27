# Contributor: Benjamin Bukowski <benjamin.bukowski@googlemail.com>
pkgname=pms-svn
pkgver=494
pkgrel=1
pkgdesc="PS3 Media Server is a DLNA compliant Upnp Media Server for the PS3, written in Java, with the purpose of streaming or transcoding any kind of media files, with minimum configuration."
arch=(any)
url="http://code.google.com/p/ps3mediaserver/"
license=('GPL2')
depends=('mplayer' 'ffmpeg' 'java-runtime' 'tsmuxer' 'libmediainfo')
makedepends=('subversion' 'apache-ant')
provides=('pms')
conflicts=('pms')
backup=('opt/pms/PMS.conf' 'opt/pms/WEB.conf')
install=$pkgname.install
source=('rc-pms' 'pms.desktop' 'pms.conf')
md5sums=('387ae6c96d63f1e6bade60c130c339ab'
         'e909cfeb522c4f9d933a0eec40037d2f'
         'a3dcdcde0c247405e4370adf1bc0f816')

_svntrunk=http://ps3mediaserver.googlecode.com/svn/trunk/
_svnmod=ps3ms

build() {	
	msg "Making sure Ant environmet is set.."
	if [[ -z "$ANT_HOME" && -r /etc/profile.d/apache-ant.sh ]]; then
		if [ -r /etc/profile.d/apache-ant.sh ]; then
			source /etc/profile.d/apache-ant.sh
		else
			return 1
		fi
	fi

	cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting ant..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/ps3mediaserver"

  ant || return 1

  install -dm755 $pkgdir/opt/pms \
                 $pkgdir/usr/bin \
                 $pkgdir/usr/share/pixmaps \
                 $pkgdir/usr/share/applications/ \
                 $pkgdir/etc/conf.d/ \
                 $pkgdir/etc/rc.d \
                 $pkgdir/var/log/

  cd dist
  mkdir pms
  tar -xf *.tgz --exclude tsMuxeR* -C ./pms/ || return 1
  cd ./pms/*/

  find . -type d -exec install -dm755 $pkgdir/opt/pms/{} \;
  find . -type f -exec install -Dm644 {} $pkgdir/opt/pms/{} \;

  sed -i '2i PMS_HOME=/opt/pms\ncd $PMS_HOME' $pkgdir/opt/pms/PMS.sh
  chmod +x $pkgdir/opt/pms/PMS.sh
  ln -sf /opt/pms/PMS.sh $pkgdir/usr/bin/pms

  touch $pkgdir/opt/pms/{PMS.conf,WEB.conf,debug.log} $pkgdir/var/log/pms.log
  chmod 644 $pkgdir/opt/pms/{PMS.conf,WEB.conf,debug.log} $pkgdir/var/log/pms.log

  install -Dm644 $srcdir/pms.conf $pkgdir/etc/conf.d/pms
  install -Dm755 $srcdir/rc-pms $pkgdir/etc/rc.d/pms
  install -Dm644 $srcdir/pms.desktop $pkgdir/usr/share/applications/
  install -Dm644 $srcdir/$_svnmod-build/ps3mediaserver/resources/images/icon-32.png $pkgdir/usr/share/pixmaps/pms.png
  
  ln -s /usr/bin/tsMuxeR $pkgdir/opt/pms/linux/tsMuxeR
}
