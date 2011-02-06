# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=rkhunter
pkgver=1.3.8
pkgrel=1
pkgdesc="An easy-to-use tool which checks machines running UNIX (clones) for the presence of rootkits and other unwanted tools"
arch=('any')
url="http://rkhunter.sourceforge.net/"
license=('GPL')
depends=('bash' 'perl' 'wget')
backup=(etc/rkhunter.conf)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0c34eb2a2d0caa384f442c11fcbb0c46')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d -m755 ${pkgdir}/usr

# fix installer for x86_64
  sed -i -e "s/lib64/lib/g" installer.sh

# install to /usr
  ./installer.sh --layout custom ${pkgdir}/usr --striproot ${pkgdir} --install

# use /etc instead of /usr/etc
  mv ${pkgdir}/usr/etc ${pkgdir}
  mv ${pkgdir}/usr/var ${pkgdir}

# fix rkhunter.conf path
  sed -i -e "s#/usr/etc/rkhunter.conf#/etc/rkhunter.conf#g" \
    ${pkgdir}/usr/bin/$pkgname
  sed -i -e "s#/usr/etc/rkhunter.conf#/etc/rkhunter.conf#g" \
    ${pkgdir}/etc/$pkgname.conf

# tmp dir path fix
  sed -i -e "s#/usr/var/lib/rkhunter/db#/var/lib/rkhunter/db#g" \
    ${pkgdir}/etc/$pkgname.conf
  sed -i -e "s#/usr/var/lib/rkhunter/tmp#/var/lib/rkhunter/tmp#g" \
    ${pkgdir}/etc/$pkgname.conf

# cleanup
  rm -f ${pkgdir}/var/lib/$pkgname/tmp/{group,passwd}

# we trust in udev
  sed -i 's|^#ALLOWHIDDENDIR=/dev/.udev$|ALLOWHIDDENDIR=/dev/.udev|' \
    ${pkgdir}/etc/$pkgname.conf
}
