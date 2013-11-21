# Maintainer: Andrew DeMaria <ademaria AT mines DOT edu>
pkgname=primesense-nite2
pkgver=2.2
pkgrel=1
pkgdesc="3D computer vision middleware for OpenNI"
# TODO check for x86 support
arch=('x86_64')
url="http://www.openni.org/files/nite/"
license=('custom')
depends=('openni2')
source=("http://www.openni.org/wp-content/uploads/2013/10/NiTE-Linux-x64-${pkgver}.tar1.zip" )
noextract=()
md5sums=('96f4cf172228cd99fdc0cdbb8de17a4a')
_source_name="NiTE-Linux-x64-2.2"

prepare() {
	unzip -f "${_source_name}.tar1.zip"
	tar -xvf "${_source_name}.tar.bz2"
}

package() {
	install -dm755 "${pkgdir}/usr/"{include/NiTE2,share/NiTE2/NiTE2/Data,share/NiTE2/java,share/doc/NiTE2,lib/NiTE2,bin}

	# Include files
	cd "${srcdir}/${_source_name}/Include"
	install *.h "${pkgdir}/usr/include/NiTE2"

	# Shared libraries
	cd "${srcdir}/${_source_name}/Redist"
	install libNiTE2.jni.so libNiTE2.so "${pkgdir}/usr/lib"

	# Data files needed by nite.  These may possibly needed to be copied into a
	# local directory
	install NiTE.ini "${pkgdir}/usr/share/NiTE2"
	cd "${srcdir}/${_source_name}/Redist/NiTE2"
	install *.{ini,dat} "${pkgdir}/usr/share/NiTE2/NiTE2"
	cd "${srcdir}/${_source_name}/Redist/NiTE2/Data"
	install *.{lbd,idx} "${pkgdir}/usr/share/NiTE2/NiTE2/Data"

	# install the jar. Again meant to be copied out as needed.
	cd "${srcdir}/${_source_name}/Redist"
	install "com.primesense.nite.jar" "${pkgdir}/usr/share/NiTE2/java"

	# License
	install -D "${srcdir}/${_source_name}/NiTE2.LICENSE.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"

	# TODO add documentation to the install

	# Install samples into bin directory
	install "${srcdir}/${_source_name}/Samples/Bin/"{SimpleUserTracker,SimpleHandTracker,HandViewer,UserViewer} "${pkgdir}/usr/bin"

}
