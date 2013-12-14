pkgname=python-mne-git
pkgver=v0.2.r3907.g401b0cd
pkgrel=1
pkgdesc="Magnetoencephalography (MEG) and Electroencephalography (EEG) in Python"
arch=('i686' 'x86_64')
url="https://github.com/mne-tools/mne-python"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=("git")
provides=("python-mne")
source=("$pkgname"::'git://github.com/mne-tools/mne-python.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
