# Contributor: SharkOS www.sharkos.org :: Chris Tusa <linisys@gmail.com>  IRC - sharkoslinux
#
# Adapted from rpm spec file and made into Arch PKGBUILD
#
pkgname=ravencore
pkgver=0.3.3
pkgrel=1
pkgdesc="The RavenCore Project is an Open Source hosting control panel aimed at making the most robust, secure, and reliable hosting software."
arch=('i686' 'x86_64')
url="http://www.ravencore.com"
license=('GPL')
groups=('webhosting')

## NOTE:
## The following dependencies will create a fully supported RavenCore install.
## If these packages already exist and have been configured, it may tromp on
## any existing configuration of these services.
##
depends=('apache' 'php' 'mysql' 'mysql-clients' 'mrtg'
	 'perl' 'perl-dbi' 'perl-dbd-mysql' 'net-snmp'
	 'postfix' 'postgrey' 'dovecot' 'spamassassin' 
	 'bind' 'vsftpd' 'clamav' 'mrtg' 'openssl'
	 'perl-libwww' 'amavisd-new')

makedepends=('unzip')
provides=()
conflicts=('webmin')
replaces=()
options=()
install=
source=(http://prdownloads.sourceforge.net/ravencore/${pkgname}-${pkgver}.tar.gz ravencore.init)
backup=('') 

noextract=()

md5sums=('acbc5cbc8c43b09699643e3d1bc3d8d3'
         '6f685eeca099245f963b77f3a9d8fba8')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  make build 

  mkdir -p \
        ${pkgdir}/etc/cron.{hourly,daily} \
        ${pkgdir}/etc/init.d \
        ${pkgdir}/etc/logrotate.d \
	${pkgdir}/etc/rc.d

  # Install RavenCore to /usr/local : This violates the standard AUR guidlines;
  # however, software such as this and CPANEL run best out of this path. Since
  # this software is designed to be installed on a clean system, we leave the 
  # defaults to make it easier to support.
  
  make DESTDIR=${pkgdir} install || return 1

  # Remove RH based init script and dir & replace with Arch adapted script
  rm -r ${pkgdir}/etc/init.d
  install -m 755 ${srcdir}/ravencore.init ${pkgdir}/etc/rc.d/ravencore


}

# vim:set ts=2 sw=2 et:
