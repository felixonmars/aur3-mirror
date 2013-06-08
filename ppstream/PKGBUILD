# Contributor: lerosua <lerosua@gmail.com>
# Contributor: vehiclee <imxifs@gmail.com>
# Contributor: tayhe <contact@tayhe.com>
# Contributor: orvice <orvice@gmail.com>
# Maintainer: tayhe <contact@tayhe.com>

pkgname='ppstream'
pkgver='1.0.2'
pkgrel='6'
arch=('i686' 'x86_64')
url='http://www.ppstream.com'
license=('unknown')
pkgdesc='PPStream for GNU/Linux'
#replace='ppstream64'
optdepends=('gksu')
if [ "$CARCH" = "i686" ]; then
	depends=('fuse' 'mplayer' 'qt4' 'codecs' 'alsa-utils'  )
	source=('http://download.ppstream.com/linux/PPStream.deb')
	md5sums=('c5d02182e34f58edd65a03d0cf42fcef')
elif [ "$CARCH" = "x86_64" ]; then
	depends=('mplayer' 'qt4' 'codecs64' 'lib32-qt4'  'alsa-utils' 'lib32-giflib' 'lib32-libpng' 'lib32-libpng12' 
         'lib32-libjpeg-turbo' 'lib32-libjpeg6' 'lib32-alsa-lib' 'lib32-libxv' 'lib32-util-linux' 
         'lib32-libxdmcp' 'lib32-glibc' 'lib32-libsm' 'lib32-zlib' 'lib32-libx11' 'lib32-libxext' 
         'lib32-libxcb' 'lib32-libxau' 'lib32-glib2' 'lib32-libxrender' 'lib32-expat'
         'lib32-pcre' 'lib32-bzip2' 'lib32-openssl' 'lib32-fontconfig' 
         'lib32-gtk-engines' 'lib32-libcanberra' 'lib32-libcanberra-pulse'  )
        source=('http://download.ppstream.com/linux/PPStream.deb')		
	md5sums=('c5d02182e34f58edd65a03d0cf42fcef')
fi

install=$pkgname.install


package()
{
cd $startdir/src/
      ar -xv PPStream.deb;
      tar -xvf data.tar.gz

	mv usr/ ${pkgdir}/ ;
	mv opt/ ${pkgdir}/ ;
	mv etc/ ${pkgdir}/ ;
mkdir -p ${pkgdir}/usr/lib/;
	ln -s /opt/pps/lib/libemscore.so.0.1.1946 ${pkgdir}/usr/lib/libemscore.so.0;
	ln -s /opt/pps/lib/libemsnet.so.0.1.1946 ${pkgdir}/usr/lib/libemsnet.so.0;

}