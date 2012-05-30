# Maintainer : Håkon Vågsether <hauk142@gmail.com>

pkgname=sshtroll-git
pkgver=20120531
pkgrel=4
pkgdesc="SSHTroll is a tiny SSH honeypot written in Python."
url="http://www.github.com/hauk142/SSHTroll"
arch=('any')
license=('GPLv3')
depends=('python2')
source=("https://github.com/hauk142/SSHTroll/tarball/master")
md5sums=('6fb881c96e67372c61d2e712debd3a33')

groups=()
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

_gitroot="git://github.com/hauk142/SSHTroll.git"
_gitname="SSHTroll"

build() {
	cd "${srcdir}"
	msg "Connecting to Github..."

	if [ -d $_gitname ]
	then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "Git done."
}

package() {
	cd "${srcdir}/SSHTroll"
	mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages"
	mkdir -p "${pkgdir}/usr/bin/"
	install -D sshtroll.py "${pkgdir}/usr/lib/python2.7/site-packages/sshtroll.py"
	install -D sshtroll "${pkgdir}/usr/bin/sshtroll"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
