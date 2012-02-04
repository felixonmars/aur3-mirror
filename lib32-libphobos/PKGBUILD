# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Chris Brannon <cmbrannon79 at gmail dot com>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Anders Bergh <anders1 at gmail dot com>
# Contributor: Dawid Ciezarkiewicz <dawid dot ciezarkiewicz at jabster dot pl>

pkgname=lib32-libphobos
pkgver=1.066
pkgrel=1
pkgdesc="Runtime library for the D programming language"
arch=('x86_64')
url="http://www.digitalmars.com/d/1.0/"
source=(http://ftp.digitalmars.com/dmd.${pkgver}.zip dmd.conf)
depends=(bin32-dmd=${pkgver})
license=('custom')
conflicts=('lib32-libtango')
md5sums=('fd2c3f8dd46d0fe4597e9d96b4ab86b2'
         '79b65bb25a86b35e9bddf64eb50ee6d3')

package() {
  install -d "${pkgdir}"/usr/include/d
  cd "${srcdir}"/dmd/src/phobos
  cp -Rf std "${pkgdir}"/usr/include/d
  cp -Rf etc "${pkgdir}"/usr/include/d
  cp -Rf internal "${pkgdir}"/usr/include/d
  cp -f {crc32,object,gcstats}.d "${pkgdir}"/usr/include/d

  install -Dm644 "${srcdir}"/dmd/linux/lib/libphobos.a "${pkgdir}"/usr/lib32/libphobos.a
  install -Dm644 "${srcdir}"/dmd.conf "${pkgdir}"/etc/dmd.conf

  # Get rid of this subdirectory; it's just an unpacked zlib source
  # distribution.
  rm -rf "${pkgdir}"/usr/include/d/etc/c/zlib
  # Insure that files and directories under /usr/include/d have
  # correct permissions.
  find "${pkgdir}/usr/include/d" -type d -print0 |xargs -0 chmod 755
  find "${pkgdir}/usr/include/d" -type f -print0 |xargs -0 chmod 644
  install -Dm644 phoboslicense.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
