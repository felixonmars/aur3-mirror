# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=git-etc
pkgver=2.2.2
pkgrel=2
pkgdesc="Simple daemon for monitoring changes in files"
arch=('x86_64')
url="https://github.com/arcan1s/git-etc"
license=("GPL")
depends=('bash' 'git')
makedeps=('python2')
optdepends=('python2-pyqt4: for GUI'
            'xterm: for GUI')
source=(https://github.com/arcan1s/git-etc/releases/download/V.${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('bffbefe3a2a5eb2fc4689d5400a01865')
backup=('etc/conf.d/git-etc.conf')

package()
{
  # daemon and gui
  install -D -m755 "${srcdir}/usr/bin/git-etc" "${pkgdir}/usr/bin/git-etc"
  install -D -m755 "${srcdir}/usr/bin/ctrlconf" "${pkgdir}/usr/bin/ctrlconf"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 "${srcdir}/usr/share/applications/ctrlconf.desktop" \
                   "${pkgdir}/usr/share/applications/ctrlconf.desktop"
  
  # service
  install -D -m644 "${srcdir}/usr/lib/systemd/system/git-etc.service" \
                   "${pkgdir}/usr/lib/systemd/system/git-etc.service"
  install -D -m644 "${srcdir}/etc/conf.d/git-etc.conf" \
                   "${pkgdir}/etc/conf.d/git-etc.conf"
  
  # man pages
  install -D -m644 "${srcdir}/usr/share/man/man1/git-etc.1" \
                   "${pkgdir}/usr/share/man/man1/git-etc.1"
  install -D -m644 "${srcdir}/usr/share/man/man1/ctrlconf.1" \
                   "${pkgdir}/usr/share/man/man1/ctrlconf.1"
  install -D -m644 "${srcdir}/usr/share/man/man5/git-etc.conf.5" \
                   "${pkgdir}/usr/share/man/man5/git-etc.conf.5"
}
