# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

pkgname=python-aws-cli
_pkgname=aws-cli
pkgver=1.0.0
pkgrel=2
pkgdesc="Universal Command Line Interface for Amazon Web Services."
arch=('any')
url="https://github.com/aws/aws-cli/"
license=('Apache 2')
groups=()
depends=(
  'python'
  'python-botocore'
  'python-colorama'
  'python-bcdoc'
  'python-rsa'
  'python-jmespath'
  'python-ply'
)
makedepends=('python-distribute')
conflicts=('python2-aws-cli' 'aws-cli')
replaces=('python2-aws-cli' 'aws-cli')
options=(!emptydirs)
source=("https://github.com/aws/$_pkgname/archive/1.0.0.tar.gz")
md5sums=('f1e0dccbb0d0cfcab25e65b07b0e62ee')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  msg 'Install zsh completion script.'
	install -D -m644 "$srcdir/$_pkgname-$pkgver/bin/aws_zsh_completer.sh" "$pkgdir/etc/zsh/aws_complete.zsh"

  msg 'Install docs.'
	install -D -m644 "$srcdir/$_pkgname-$pkgver/requirements.txt" "$pkgdir/usr/share/doc/$pkgname/requirements.txt"

  msg 'Install LICENSE.'
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
