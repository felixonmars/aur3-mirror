# Contributor: Anton Pirogov <anton pirogov at gmail dot com>
pkgname=rts5229
pkgver=1.0.7
pkgrel=5
license=('unknown')
pkgdesc="Realtek PCIE RTS5229 card reader driver"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=15&PFid=25&Level=4&Conn=3&DownTypeID=3&GetDown=false"
md5sums=('0ecf8bea0ea3842391c68da72fe4c425')
depends=('linux-headers')
makedepends=('gcc')
install='rts5229.install'

build() {
  wget http://gehidore.net/drivers/Realtek_RTS5229_Linux_Driver_v1.07.zip
  unzip Realtek_RTS5229_Linux_Driver_v1.07.zip
  tar xf Realtek_RTS5229_Linux_Driver_v1.07/rts5229.tar.bz2
  cd rts5229
  sed '41 c\\tcp $(TARGET_MODULE).ko ${DESTDIR}/lib/modules/$(shell uname -r)/kernel/drivers/scsi -f' Makefile > MakefileMod
  rm Makefile
  mv MakefileMod Makefile
  mkdir -p $pkgdir/lib/modules/$(uname -r)/kernel/drivers/scsi
  make
  make DESTDIR="$pkgdir" install
}

