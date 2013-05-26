# Contributor: Mark Pustjens <pustjens@dds.nl>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Chee Sing Lee <cheesinglee AT gmail DOT com>
pkgname=dfhack-myne
pkgver=0.34.11
pkgrel=3
pkgdesc="DFHack is a Dwarf Fortress memory access library and a set of basic tools that use it. Build for the dwarffortress-myne package."
arch=('i686' 'x86_64')
url="https://github.com/peterix/dfhack"
install="$pkgname.install"
license=('custom:zlib')
depends=(dwarffortress-myne)
optdepends=('lib32-allegro: For stonesense'
        'lib32-libjpeg6-turbo: For stonesense')
source=(dfhack-myne
        "http://dethware.org/dfhack/download/dfhack-${pkgver}-r${pkgrel}-Linux.tar.gz")
md5sums=('fda4c53a0b90cb9a9e2ccd17a52baf1c'
         '1de4283f17350dd6057a81644cd678f0')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install ${srcdir}/dfhack-myne ${pkgdir}/usr/bin/dfhack-myne
  install -d ${pkgdir}/opt/df_linux-myne
  install ${srcdir}/dfhack ${pkgdir}/opt/df_linux-myne/
  install ${srcdir}/dfhack.init-example ${pkgdir}/opt/df_linux-myne/
  cp -r ${srcdir}/hack ${pkgdir}/opt/df_linux-myne/
  cp -r ${srcdir}/stonesense ${pkgdir}/opt/df_linux-myne/
  find ${pkgdir} -type f -print0 | xargs -0 chmod 644 
  find ${pkgdir} -type d -print0 | xargs -0 chmod 755
  chmod 755 ${pkgdir}/opt/df_linux-myne/dfhack
  chmod 755 ${pkgdir}/opt/df_linux-myne
  chmod 755 ${pkgdir}/usr/bin/dfhack-myne

  # Compatibility with binary patches
  sed -i "/v0.34.11 linux/a \        <md5-hash value='572e420382d228096dd6a89a7fc716e1'/>" ${pkgdir}/opt/df_linux-myne/hack/symbols.xml
}

# vim:set ts=2 sw=2 et:
