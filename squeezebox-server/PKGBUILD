# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squeezebox-server
pkgver=7.6.1
pkgrel=1
pkgdesc='Streaming audio server supported by Logitech'
arch=('i686' 'x86_64')
url='http://www.mysqueezebox.com/download'
license=('GPL')
depends=('perl')
replaces=('squeezecenter' 'squeezeboxcenter')
source=("http://downloads.slimdevices.com/SqueezeboxServer_v${pkgver}/squeezeboxserver-${pkgver}.tgz"
        'perl-5.14.patch'
        'scanner.patch'
        'conf.d'
        'rc.d')
backup=('etc/conf.d/squeezebox-server')
sha1sums=('aae42e4c25b1d8a4f57d6ea5e0d393e4a6f5f204'
          'bf9b04da56d8e365c7970f8b1544f1ce374344b2'
          '241d93fdebbc13f7fe734f2165e87bd3fad7bc69'
          'edaa6af06eae98d253a690fdf5abf6a6f07796d0'
          '999fb59f99dd87fffbf27532a501c086b9db087e')

install=install

makedepends=('nasm' 'yasm')
depends=('perl>5.13' 'perl<5.15' 'perl-dbi')

build_cpan() {
	svnurl=svn.slimdevices.com/repos/slim/7.6/trunk/vendor/CPAN/
	wget -r --no-parent http://${svnurl} --reject 'mysql-*'
	pushd ${svnurl}
	wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Sub-Name-0.05.tar.gz
	sed \
		-e '/build DBI/d' \
		-e '/build_module DBI/d' \
		-e '/build DBD::mysql/d' \
		-e '/RUN_TESTS=1/c RUN_TESTS=0' \
		-e 's/Sub-Name-0.04/Sub-Name-0.05/g' \
		-e 's/perl5.12.3/perl/g' \
		-e 's/5.12.3/5.14.1/g' \
		-e 's/5.12/5.14/g' \
		-e 's/512/514/g' \
		-i buildme.sh
	chmod +x buildme.sh
	./buildme.sh
	popd
	sed \
		-e '/Sub::Name 0.04/c Sub::Name 0.05' \
		-e '/Audio::Scan 0.88/c Audio::Scan 0.9' \
		-i modules.conf
	cp -r ${svnurl}build/5.14/lib/perl5/*-linux-thread-multi/* CPAN/
	cp -r ${svnurl}build/arch CPAN/
	rm -fr svn.slimdevices.com
}

build() {
	cd "${srcdir}"/squeezeboxserver-*-*
	rm -r Bin/{arm-linux,darwin,i386-freebsd-64int,powerpc-linux}
	rm -r CPAN/arch/5.{8,10,12}
	build_cpan
	patch -p1 -i ../perl-5.14.patch
	patch -p1 -i ../scanner.patch
	#rm -r CPAN/arch/5.14/{arm-linux-gnueabi-thread-multi,darwin-thread-multi-2level,powerpc-linux-thread-multi}
	#[[ ${CARCH} = i686   ]] && rm -r CPAN/arch/5.14/x86_64-linux-thread-multi || true
	#[[ ${CARCH} = x86_64 ]] && rm -r CPAN/arch/5.14/i386-linux-thread-multi || true
}

package() {
	cd "${srcdir}"/squeezeboxserver-*-*
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a * "${pkgdir}/opt/${pkgname}/"
	install -D -m755 ../rc.d "${pkgdir}/etc/rc.d/${pkgname}"
	install -D -m644 ../conf.d "${pkgdir}/etc/conf.d/${pkgname}"
}
