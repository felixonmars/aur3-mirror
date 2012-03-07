# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=mathnetnumerics
pkgver=Beta2
_downloadid=172197
_filetime=129475109693200000
_build=18506
pkgrel=3
pkgdesc="Math.NET Numerics, a numerical library for .Net, Silverlight and Mono"
arch=('any')
url="http://numerics.mathdotnet.com/"
license=('MIT')
depends=('mono' 'zlib-net>=1.0.0')
source=("http://download.codeplex.com/Download?ProjectName=$pkgname&DownloadId=${_downloadid}&FileTime=${_filetime}&Build=${_build}")
md5sums=('3a87c180379ba7d5f032266ebf7fbeb2')

build() {
  cd "$srcdir"

  install -D -m644 lib/Net40/MathNet.Numerics.dll "$pkgdir"/usr/lib/mono/4.0/MathNet.Numerics.dll
  install -D -m644 lib/Net40/MathNet.Numerics.FSharp.dll "$pkgdir"/usr/lib/mono/4.0/MathNet.Numerics.FSharp.dll
  install -D -m644 License.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

