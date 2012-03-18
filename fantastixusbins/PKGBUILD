pkgname=fantastixusbins
pkgver=0.1
pkgrel=1
pkgdesc="Script collection from fantastic001."
url="https://sourceforge.net/projects/fantastixusbins/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('bash')
optdepends=('lxappearance: for install-theme script' 'lynx: for ip-public')
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
md5sums=('88c78ffdecaf5c9117e5bf78da1ba745')  

#build() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "$pkgdir/home/bin"
	cp * "$pkgdir/home/bin/"
}

post_install() 
{
echo "
Please add /home/bin to your PATH variable if you already not
"
}
