# Mantainer: Luca Cesari <mirshann@freakmind.org>

pkgname=dt-s3-backup
pkgver=20110510
pkgrel=1
pkgdesc="Bash script for automated backups with duplicity and Amazon's S3 online storage"
url=https://github.com/thornomad/dt-s3-backup
arch=('any')
license=('GPL3')
makedepends=("git" "bash" "duplicity" "s3cmd")
provides=('dt-s3-backup')
install=("dt-s3-backup.install")

_gitroot="https://github.com/thornomad/dt-s3-backup.git"
_gitname="dt-s3-backup"

build() {
	cd ${srcdir}
	msg "Connecting to git server..."

	if [ -d ${srcdir}/${_gitname} ]; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} --depth=1 ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	
	# license
	install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# readme & script
	install -Dm644 "${srcdir}/${_gitname}/README" "${pkgdir}/usr/share/doc/${_gitname}/README"
	install -Dm644 "${srcdir}/${_gitname}/dt-s3-backup.sh" "${pkgdir}/usr/share/doc/${_gitname}/dt-s3-backup.sh"
}
