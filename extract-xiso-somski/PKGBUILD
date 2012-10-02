# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=extract-xiso-somski
pkgver=2.7
pkgrel=2
pkgdesc="xdvdfs (xbox iso) file creation and extraction utility mod by somski"
arch=('i686' 'x86_64')
url="http://forums.xbox-scene.com/index.php?showtopic=706287&st=90&p=4828718&#entry4828718"
license=('custom')
conflicts=('extract-xiso')
provides=('extract-xiso')
source=(http://dl.dropbox.com/u/26622025/Stora/extract-xiso_v2.7_src_110930_by_somski.tar.gz)
md5sums=('6593ab6a894d24b2109a2562b5406b3a')

build() {
  cd ${srcdir}/extract-xiso
  # build
  make 
  # install binary
  install -Dm755 extract-xiso ${pkgdir}/usr/bin/extract-xiso
  # install custom license
  install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT
}

