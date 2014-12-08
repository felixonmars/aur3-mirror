pkgname=gsutil
pkgver=4.7
pkgrel=3
pkgdesc="A command line tool for interacting with cloud storage services."
arch=('any')
url="https://github.com/GoogleCloudPlatform/gsutil"
license=('APACHE')
depends=('python2' 'python2-socksipy-branch>=1.01' 'python2-crcmod>=1.7' 'python2-pyopenssl>=0.13' 'python2-google-api-python-client>=1.1' 'python2-boto>=2.9' 'python2-httplib2>=0.8' 'python2-gflags>=2.0')
makedepends=('python2-distribute' 'openssl' 'python2-setuptools' 'libffi')
source=("https://storage.googleapis.com/pub/gsutil.tar.gz")
md5sums=("45e8ab071036f6fe0ad9e6aebd4f2935")
     
package() {
	mkdir -p "$pkgdir/usr/share"
        mkdir -p "$pkgdir/etc/profile.d"

	echo "export PATH=\$PATH:/usr/share/gsutil" >> "$pkgdir/etc/profile.d/gsutil.sh"
	cp -a "$srcdir/$pkgname" "$pkgdir/usr/share/$pkgname"

	sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g' "$pkgdir/usr/share/gsutil/gsutil" 

}


