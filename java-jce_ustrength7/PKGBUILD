# Maintainer: Cedric Sougne <cedric@sougne.name>
# Contributor: Tom < reztho at archlinux dot us >
pkgname=java-jce_ustrength7
pkgver=7
pkgrel=1
pkgdesc="Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 7"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html"
license=('custom')
depends=('jre')
install=${pkgname}.install
source=('http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip' 'install_java_jce_ustrength')
_zipfile="UnlimitedJCEPolicyJDK${pkgver}.zip"

build() {
	# Oracle doesn't give us a direct download for jce_policy-6.zip
	# So the user must download it manually...
	if [ ! -e "$(dirname ${srcdir})/${_zipfile}" ]; then
		echo 
		echo "You need to download this manually from Oracle:"
		echo "JCE Unlimited Strength Jurisdiction Policy Files 6 Release Candidate: ${_zipfile}"
		echo "and put it in the same directory of this PKGBUILD."
		echo
		echo "Go to: ${url}"
		echo
		return 1
	fi

    [ ! -e "${srcdir}/${_zipfile}" ] && ln -s $(dirname ${srcdir})/${_zipfile} ${srcdir} &> /dev/null

	_mdfiveneeded=c47e997b90ddfd0d813a37ccc97fb933
	_mdfivefile=$(md5sum ${srcdir}/${_zipfile} | cut -d " " -f 1)
	if [ "${_mdfiveneeded}" != "${_mdfivefile}" ]; then
		echo
		echo "The MD5SUM of ${_zipfile} isn't correct."
		echo "Unfinished download or updated zip file."
		echo
		return 1
	fi

	# Fixed place for the jce_policy files
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}/
	cd ${pkgdir}/usr/share/java/${pkgname}/
	bsdtar -xf ${srcdir}/${_zipfile}
	mv UnlimitedJCEPolicy/* .
	rmdir UnlimitedJCEPolicy
	find ${pkgdir}/usr/share/java/${pkgname}/* -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/share/java/${pkgname}/* -type d -exec chmod 755 {} \;

	# Installing the script
	mkdir -p ${pkgdir}/sbin/
	install -m 755 ${srcdir}/install_java_jce_ustrength ${pkgdir}/sbin/

	# The documentation
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	mv ${pkgdir}/usr/share/java/${pkgname}/README.txt ${pkgdir}/usr/share/doc/${pkgname}/
}

md5sums=('c47e997b90ddfd0d813a37ccc97fb933' 'f77ff988319bdbc2407395192fcb2ca0')
