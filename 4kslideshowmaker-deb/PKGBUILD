# Contributer: giacomogiorgianni@gmail.com

pkgname=4kslideshowmaker-deb
name=4kslideshowmaker
pkgver=1.1
pkgrel=1
pkgdesc="is an easy and free app to create slideshows for PC, Mac and Linux."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/it/"
license=('LGPL2.1-EULA')
depends=('nvidia-utils' 'fontconfig-ubuntu' 'qt5-base' 'ffmpeg' 'icu' 'x264' 'downverter-deb' 'lame' 'opencv' 'portaudio' 'libjpeg-turbo' 'libexif')
install="$name.install"
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('32ab1b52d258e1782b6383dbc65d099f')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
    md5sums=('055828fe8038c8001af3e5d7e8d49299')
fi

source=("http://4kdownload.googlecode.com/files/${name}_${pkgver}-${pkgrel}_${ARCH}.deb")
build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/dfm_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
	# not compatiblr qt
	rm -- ${startdir}/pkg/usr/lib/$name/{libx264*,libicu*,libv*,libQt*,libav*,libsw*,libmp3*,libopencv*,libj*,libex*,libpo*}
	#rm -- ${startdir}/pkg/usr/lib/$name/libQt*
	ln -s /usr/lib/libicudata.so ${startdir}/pkg/usr/lib/$name/libicudata.so.49
	ln -s /usr/lib/libicuuc.so ${startdir}/pkg/usr/lib/$name/libicuuc.so.49
	ln -s /opt/downverter/ffbin/libvo-aacenc.so.0 ${startdir}/pkg/usr/lib/$name/libvo-aacenc.so.0
	ln -s /usr/lib/libx264.so.129 ${startdir}/pkg/usr/lib/$name/libx264.so.128 
	#sed -i '6s|/usr/|exec /usr/|' ${startdir}/src/usr/lib/4kstogram/4kstogram.sh
	#mkdir ${pkgdir}/usr/bin
	install -D -m755 "${srcdir}/usr/lib/$name/$name.sh" "${pkgdir}/usr/bin/$name" 
	#ln -s "/usr/lib/4kstogram/4kstogram.sh" "${pkgdir}/usr/bin/4kstogram"
}