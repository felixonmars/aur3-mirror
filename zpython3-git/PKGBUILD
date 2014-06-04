# Maintainer: Aleksander Nitecki <ixendr@itogi.re>

pkgname=zpython3-git
pkgver=5.0.5
pkgrel=1
pkgdesc='Zsh python module (Python3, git version)'
arch=('i686' 'x86_64')
url='https://bitbucket.org/ZyX_I/zsh/src/zpython'
license=('custom')
depends=('python' 'zsh')
provides=('zpython')
conflicts=('zpython')
source=("git+https://bitbucket.org/ZyX_I/zsh#branch=zpython")
md5sums=('SKIP')

prepare() {
		cd "${srcdir}/zsh"

		sed -i 's/subdir in Src Doc;/subdir in Src;/g' Makefile.in
}

build() {
	cd "${srcdir}/zsh"

	Util/preconfig

	./configure --prefix=/usr \
		--enable-zpython \
		--with-python-version=3.4m \
		--with-python-executable=/usr/bin/python3.4 \
		--with-python-config-dir=/usr/lib/python3.4/config-3.4m

	#./configure --prefix=/usr \
	#	--enable-zpython \
	#	--with-python-executable=/usr/bin/python2.7 \
	#	--with-python-config-dir=/usr/lib/python2.7/config

	make #Src/Modules/zpython.so

	#cd Src/Modules
	#make zpython.so
}

package() {
	cd "${srcdir}/zsh/Src/Modules"

	install -D -m755 zpython.so "${pkgdir}/usr/lib/zpython/zsh/zpython.so"
}
