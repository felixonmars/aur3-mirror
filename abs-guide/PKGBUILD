# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=abs-guide
pkgver=10
pkgrel=1
pkgdesc="Advanced Bash Scripting HTML Guide"
arch=(any)
options=(!strip !zipman)
url="http://bash.deta.in"
license=('PUBLIC DOMAIN')
source=("http://bash.deta.in/${pkgname}-latest.tar.bz2"
				"abs-guide" 
				"abs-guide.desktop"
)
md5sums=('SKIP'
         '17a2a47e8c7edafdd9b40724ab155537'
         '84bcd8a9e9ebf239b0d8a3800e491a39')

pkgver() {
	echo "$(sed -n 's/Current version = \(.*\)$/\1/p' abs/Change.log | tr -d ' ' )"
}

package() {
  mkdir -p "$pkgdir"/usr/share/doc/abs-guide
  cp -r "$srcdir"/abs/*   "$pkgdir"/usr/share/doc/abs-guide/
  rm "$pkgdir"/usr/share/doc/abs-guide/*.sgml
  chmod go+r,u+w "$pkgdir"/usr/share/doc/abs-guide/*

  # install helper app & desktop file
  install -D -m755 abs-guide "$pkgdir"/usr/bin/abs-guide
  install -D -m644 abs-guide.desktop	"$pkgdir"/usr/share/applications/abs-guide.desktop
}

