# Contributor: Michael Kedzierski <waikurosu@gmail.com>
pkgname=pyamazon
pkgver=0.65
pkgrel=1
pkgdesc="a Python wrapper for the Amazon v3.x web api"
url="http://www.josephson.org/projects/pyamazon/"
license="Python"
depends=('python')
source=(http://www.josephson.org/projects/pyamazon/files/$pkgname-$pkgver.zip)
md5sums=('0c505c014901014ec3e3fe5e8c8eef45')

build() {
cd $startdir/src/$pkgname

# Ask python where its site-packages dir lives.
_site_packages_dir=$(echo "import distutils.sysconfig
print distutils.sysconfig.get_python_lib()" | python -)

mkdir -p $startdir/pkg$_site_packages_dir
cp amazon.py $startdir/pkg$_site_packages_dir
}
