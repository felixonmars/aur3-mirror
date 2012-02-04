# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Submitter: William Díaz <wdiaz[at]archlinux[dot]us>

pkgname=boot-update
pkgver=1.5.2
pkgrel=1
pkgdesc="Funtoo Core Boot Framework for global boot loader configuration"
arch=("i686" "x86_64")
url="http://www.funtoo.org/wiki/Boot-Update"
license=("GPL3")
depends=('python2' 'grub2')
install="${pkgname}.install"
binfont="grub-unifont-1.0"
source=("http://www.funtoo.org/archive/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "http://www.funtoo.org/archive/grub/${binfont}.tar.bz2"
        "boot.conf.example")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install Python Modules
  install -d "${pkgdir}"/usr/lib/python2.7/site-packages/
  cp -R python/modules/funtoo "${pkgdir}"/usr/lib/python2.7/site-packages/ || return 1

  # Install bin
  install -d "${pkgdir}"/sbin
  install sbin/boot-update "${pkgdir}"/sbin || return 1

  # Documentation
  install -d  "${pkgdir}"/usr/share/doc/"${pkgname}"
  install -m644 doc/*.rst "${pkgdir}"/usr/share/doc/"${pkgname}" || return
  install -m644 "${srcdir}"/boot.conf.example "${pkgdir}"/usr/share/doc/"${pkgname}" || return 1

  install -d "${pkgdir}"/usr/share/man/{man8,man5} || return
  [ -e doc/boot.conf.5 ] && gzip doc/boot.conf.5
  [ -e doc/boot-update.8 ] &&  gzip doc/boot-update.8
  install -m644 doc/boot.conf.5.gz "${pkgdir}"/usr/share/man/man5
  install -m644 doc/boot-update.8.gz "${pkgdir}"/usr/share/man/man8

  # Install Unifont
  cp -R "${srcdir}"/boot "${pkgdir}" || return 1
}

md5sums=('e1fa54ea150fca6d5f16dd005dcbe881'
         '568d7d4a0938d950f6b3596b6c658b21'
         '86dcfe73b0b18747e598d7b14effea7d')
