# Contributor: Wag <wag at wag-net dot ch>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel dot de>

pkgname="uswsusp-splashy-git"
pkgver=20100328
pkgrel=1
pkgdesc="Allows suspending with new userspace suspend and Splashy."
arch=('i686' 'x86_64')
url="http://suspend.sourceforge.net"
license=('GPL')
depends=('lzo2' 'libx86' 'libgcrypt' 'splashy')
makedepends=('libgcrypt' 'gcc' 'make' 'git')
conflicts=('suspend' 'uswsusp')
provides=('uswsusp')
options=('docs' 'zipman')
backup=('etc/suspend.conf')
install=uswsusp.install
source=(uresume-hook
	uresume-install
	s2ram-chvt63.patch)
md5sums=('a2dfd5ad0d1875a572fdfc134dcd049f'
         'e6939703649eba3536f836f99f49b7fd'
         '373aa7f45152c843025a3b09b7ddc6f9')

_gitroot=git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-utils.git
_gitname=v0.9

build() {
	cd ${srcdir}

	# Get GIT repository
	msg "Connecting to GIT server..."
	if [[ -d ${_gitname} ]]; then
	  (cd ${_gitname} && git pull origin)
	else
	  git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf ${_gitname}-build
	cp -r ${_gitname} ${_gitname}-build
	cd ${_gitname}-build

	# Checkout correct version
	git checkout ${_gitname}


	# Switch to a black screen instead of console on s2ram
	patch -Np1 -i ../s2ram-chvt63.patch || return 1

	./autogen.sh
	./configure --enable-compress --enable-encrypt \
		--disable-resume-static --disable-static \
		--enable-splashy \
		--prefix=/usr --sysconfdir=/etc
	make DESTDIR=${pkgdir} install || return 1

	install -D -m 644 ../uresume-hook ${startdir}/pkg/lib/initcpio/hooks/uresume && \
	install -D -m 644 ../uresume-install ${startdir}/pkg/lib/initcpio/install/uresume
}
