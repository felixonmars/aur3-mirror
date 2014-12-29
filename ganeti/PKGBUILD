pkgname=ganeti
pkgver=2.12.0
pkgrel=1
pkgdesc="Cluster-based virtualization management software"
url="http://www.ganeti.org/"
source=("http://downloads.ganeti.org/releases/2.12/ganeti-2.12.0.tar.gz" "PKGBUILD.old")
sha1sums=('c348d97cef5580093218a55fc14abeff6066302e'
          '8f4d13cee3d6ae840f4608d95dbbeff287467a5d')
arch=(i686)
depends=('haskell-pandoc'
         'socat'
		 'python-sphinx'
		 'graphviz'
		 'python-pylint'
		 'pep8'
		 'python-coverage'
		 'qemu'
		 'haskell-curl'
		 'haskell-json'
		 'haskell-hinotify'
		 'haskell-crypto'
		 'haskell-test-framework'
		 'haskell-test-framework-hunit'
		 'haskell-test-framework-quickcheck2'
		 'haskell-regex-pcre'
		 'haskell-snap-server'
		 'python-pyopenssl'
		 'python-simplejson'
		 'python-pyparsing'
		 'python-pyinotify'
		 'python-pycurl'
		 'python-bitarray'
		 'python-ipaddr'
		 'python-mock'
		 'python-psutil'
		 'python-paramiko'
		 'python-yaml')

function build()
{
	cd $srcdir/$pkgname-$pkgver
	./configure
	make
}
