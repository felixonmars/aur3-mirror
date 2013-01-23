pkgname=rts5229-dkms
_basename=rts5229
pkgver=1.0.7
pkgrel=1
license=('unknown')
pkgdesc="Realtek PCIE RTS5229 card reader driver"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=15&PFid=25&Level=4&Conn=3&DownTypeID=3&GetDown=false"
md5sums=('0ecf8bea0ea3842391c68da72fe4c425')
depends=('dkms')
conflicts=('rts5229')
provides=('rts5229')

source=("http://gehidore.net/drivers/Realtek_RTS5229_Linux_Driver_v1.07.zip"
        "dkms.conf"
        "rts5229.install")

install="rts5229.install"

sha256sums=('a89e76e3da62eb3b68d19bbf39def328249993ffd7f3a2ef6b5e793a2cb3dee7'
            '4aa9f0430a5bfa692d458a1225e2a28a86e0fafa1f6b225bfd93c43aa0220814'
            '03a052d3075433df1b11e860fc870c09e1b0ee6256612f97da093353ea2520e8')

md5sums=('0ecf8bea0ea3842391c68da72fe4c425'
         '5165f9846b717e97a89b2b4392924a5e'
         '127cd78daf0e5c7ae2772cff2905c3ca')


package() {
  unzip -o Realtek_RTS5229_Linux_Driver_v1.07.zip
  tar xf Realtek_RTS5229_Linux_Driver_v1.07/rts5229.tar.bz2
  cd rts5229
  mkdir -p $pkgdir/usr/src/$pkgname-$pkgver
  cp -pr * $pkgdir/usr/src/$pkgname-$pkgver
  cp $srcdir/dkms.conf $pkgdir/usr/src/$pkgname-$pkgver
}

