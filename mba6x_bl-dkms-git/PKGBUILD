# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Frank Shin <frankshin82@gmail.com>

pkgname=mba6x_bl-dkms-git
_pkgname=mba6x_bl
pkgver=254.5fb7a4e
pkgrel=1
pkgdesc="Backlight for mba6x to fix post suspend/resume brightness."
url='https://github.com/patjak/mba6x_bl'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dkms')
install=mba6x_bl-dkms-git.install
provides=('mba6x_bl-dkms' 'mba6x_bl')
conflicts=('mba6x_bl-dkms' 'mba6x_bl')
source=("git+ssh://git@github.com/patjak/mba6x_bl.git"
        'mba6x_bl-dkms.conf'
        'mba6x_bl-dkms-git.install'
        '98-mba6bl.conf')
md5sums=('SKIP'
         '1d04b891c7a387a845a1eac768749c6b'
         '4aa3e0241875cbb60fe00cb8349233df'
         '6ba3ee322b4fc4f0c23c2c6f955b005b')

backup=('etc/modules-load.d/mba6x_bl-dkms.conf')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"
  install -Dm 644 mba6x_bl-dkms.conf "${pkgdir}/etc/modules-load.d/mba6x_bl-dkms.conf"
  install -Dm 644 98-mba6bl.conf "${pkgdir}/etc/X11/xorg.conf.d/98-mba6bl.conf"

  cd "${srcdir}/mba6x_bl"
  for FILE in Makefile dkms.conf mba6x_bl.c; do
    install -Dm 644 $FILE "${pkgdir}/usr/src/mba6x_bl-$pkgver/$FILE"
  done

}
